class User < ApplicationRecord
  belongs_to :role
  has_one :image, as: :imageable

  has_many :rooms_users
  has_many :rooms, through: :rooms_users

  validates :first_name, :last_name, :primary_contact, :gender ,:role_id, presence: true
end