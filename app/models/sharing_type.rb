class SharingType < ApplicationRecord
	SHARING_ROOM_TYPE = ['Individual','Shared']
  belongs_to :room
  validates :name, presence: true, uniqueness: true
end