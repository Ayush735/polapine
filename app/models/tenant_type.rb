class TenantType < ApplicationRecord
	TENANT_TYPE = ['Student', 'Employee']
  belongs_to :room
  validates :name, presence: true, uniquness:true
end