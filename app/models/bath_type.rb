class BathType < ApplicationRecord
  BATH_TYPE_LIST = ['Attached','Non-Attached']
  belongs_to :room
  validates :name, presence: true, uniqueness: true
end