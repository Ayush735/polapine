class Policy < ApplicationRecord
	POLICY_LIST = ['No Smoking', 'Noise Levels', 'Garbage Collection', 'Parking', 'Visitors', 'Departure', 'Full and Final']
  belongs_to :room
  validates :name, presence: true,  uniqueness: true
end