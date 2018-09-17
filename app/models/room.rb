class Room < ApplicationRecord
  belongs_to :property
  
  has_one :furnishing_type
  has_one :bath_type
  has_one :sharing_type
  has_one :tenant_type

  has_one :address, as: :addressable
  
  has_many :amenities
  has_many :policies
  has_many :expences

  has_many :images, as: :imageable

  has_many :rooms_users
  has_many :users, through: :rooms_users

  validates :sqr_ft, :rent, :deposit, :current_status, :no_of_beds, presence:true
end
