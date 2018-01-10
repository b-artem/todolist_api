class Task < ApplicationRecord
  belongs_to :project

  after_initialize(on: :create) { self.done ||= false }
  validates :name, presence: true, length: { minimum: 1 },
            uniqueness: { message: I18n.t('models.task.already_exists') }
  validates :done, inclusion: { in: [true, false] }
end
