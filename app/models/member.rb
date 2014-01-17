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

  def initialize
    @member = random_member
    @name_options = Member.all.reject{|m| m == @member}.map{|m| m.full_name}.sample(3) << @member.full_name
  end
  def random_member
    Member.random_member
  end

  def self.random_member
    person = self.find("#{rand(1..self.count)}")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
