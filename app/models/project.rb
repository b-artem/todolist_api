class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1 },
                   uniqueness: { message: I18n.t('models.project.already_exists') }
end
