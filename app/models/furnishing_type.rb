class FurnishingType < ApplicationRecord
	FURNISHING_ROOM_TYPE= ['Semi Furnished', 'Fully Furnished', 'Un Furnished']
  belongs_to :room
  validates :name, presence: true, uniquness:true
end
