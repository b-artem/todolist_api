class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :name, presence: true, length: { minimum: 1 }
end
