class Member < ActiveRecord::Base
  GENDERS = %w[Male Female]
  ROLES = %w[Member Admin]

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :role, inclusion: {in:ROLES}
  validates :email, presence:true, email:true
  validates :gender, inclusion: {in:GENDERS}, presence:true

  has_many :identities
  has_many :identity_types, through: :identities

  mount_uploader :photo_url, PhotoUrlUploader

  def full_name
    [first_name, last_name].compact.join(', ')
  end

end
