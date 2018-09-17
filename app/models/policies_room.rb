class PoliciesRoom < ApplicationRecord
  belongs_to :policy
  belongs_to :room
end
