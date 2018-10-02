class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          # :confirmable, :omniauthable

  include DeviseTokenAuth::Concerns::User
  
  belongs_to :role, optional:true
  has_one :image, as: :imageable

  # has_many :rooms_users
  # has_many :rooms, through: :rooms_users

  # validates :first_name, :last_name, :primary_contact, :gender ,:role_id, presence: true
end