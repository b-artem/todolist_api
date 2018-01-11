class Task < ApplicationRecord
  belongs_to :project
  acts_as_list scope: :project, column: :priority

  after_initialize :set_initial_values, on: :create
  validates :name, presence: true, length: { minimum: 1 },
            uniqueness: { scope: :project, message: I18n.t('models.task.already_exists') }
  validates :done, inclusion: { in: [true, false] }, allow_blank: true

  private

    def set_initial_values
      self.done = false
    end
end
