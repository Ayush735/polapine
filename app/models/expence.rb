class Expence < ApplicationRecord
	EXPENCES_LIST = ['Electricity Bill', 'Cleaning', 'Garbage Collection']
  belongs_to :room
  validates :name, presence: true, uniqueness: true
end
