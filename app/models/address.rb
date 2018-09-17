class Address < ApplicationRecord
  belongs_to :room
  belongs_to :addressable, polymorphic: true
end