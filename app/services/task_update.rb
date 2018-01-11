module Services
  class TaskUpdate
    DIRECTIONS = %w[up down].freeze

    def initialize(task:, task_params:, change_priority: nil)
      @task = task
      @task_params = task_params
      @change_priority = change_priority
    end

    def call
      return @task.update_attributes(@task_params) unless @change_priority
      Task.transaction do
        update_priority
        update_all_except_priority
      catch
        return false
      end
    end

    private

      def update_priority
        unless DIRECTIONS.include?(@change_priority)
          @task.errors.add(:priority, I18n.t('models.task.wrong_priority'))
          return false
        end
        @change_priority == 'up' ? @task.move_higher : @task.move_lower
      end

      def update_all_except_priority
        @task.update_attributes(@task_params)
      end
  end
end
