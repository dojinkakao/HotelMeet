class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  attachment :profile_image

  validates :username, presence: true
end
