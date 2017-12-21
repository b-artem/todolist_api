class User < ActiveRecord::Base
  # validates_confirmation_of :password
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable, :recoverable
          # :omniauthable, :confirmable,
  include DeviseTokenAuth::Concerns::User

  has_many :projects, dependent: :destroy


end
