class Member < ActiveRecord::Base
  GENDERS = %w[male female]
  ROLES = %w[student staff]

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :role, inclusion: {in:ROLES}
  validates :email, presence:true, email:true
  validates :gender, inclusion: {in:GENDERS}, presence:true

  belongs_to :user,
    inverse_of: :members

  has_many :member_informations
end
