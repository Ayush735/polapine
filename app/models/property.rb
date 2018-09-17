class Property < ApplicationRecord
  belongs_to :property_type
  has_many :rooms
end
