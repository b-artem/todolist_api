class Task < ApplicationRecord
  belongs_to :project

  after_initialize(on: :create) { self.done ||= false }
  validates :name, presence: true, length: { minimum: 1 }
  validates :done, inclusion: { in: [true, false] }
end
