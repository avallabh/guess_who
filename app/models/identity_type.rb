class IdentityType < ActiveRecord::Base
  has_many :identities

  has_many :members, through: :identities
end
