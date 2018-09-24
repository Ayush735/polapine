class Role < ApplicationRecord
	ROLE_LIST = ['Admin','Owner','Tenant']
  has_many :users
  validates :name, presence: true, uniqueness: true
end