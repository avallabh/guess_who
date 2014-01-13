class User < ActiveRecord::Base
  validates_presence_of :uid, :name #, :github_token
  validates_uniqueness_of :uid #, :display_name

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end



end
