class Member < ActiveRecord::Base
  GENDERS = %w[Male Female]
  ROLES = %w[Member Admin]

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :role, inclusion: {in:ROLES}
  validates :email, presence:true, email:true
  validates :gender, inclusion: {in:GENDERS}, presence:true

  belongs_to :user,
    inverse_of: :members

  has_many :member_informations
end
