class MemberInformation < ActiveRecord::Base
  validates_presence_of :key
  validates_presence_of :value

  belongs_to :member
end
