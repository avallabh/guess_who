class Identity < ActiveRecord::Base
  validates_presence_of :value

  belongs_to :member
  belongs_to :identity_type

  # KEYS = {
  #   "github" => {url: 'http://gihtub.com/'},
  #   "twitter" => {url: 'http://twitter.com'},
  #   "linkedin" => {url: 'http://www.linkedin.com/in/'},
  #   "hometown" => nil,
  #   "interests" => nil
  # }

  # validates :key, inclusion: {in:KEYS.keys}

  # def get_url
  #   if KEYS[self.key][:url].nil?
  #     return nil
  #   else
  #     return KEYS[self.key][:url]+self.value
  #   end
  # end

end
