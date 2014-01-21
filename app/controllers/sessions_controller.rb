=begin
provider: github
uid: '5490993'
info: !ruby/hash:OmniAuth::AuthHash::InfoHash
  nickname: avallabh
  email: ajay.vallabh@gmail.com
  name: Ajay Vallabh
  image: https://gravatar.com/avatar/3ae55fc2791395e3b0d29046537ca68c?d=https%3A%2F%2Fidenticons.github.com%2F5e9435c7ae8aca56fb88f9dbc1ce7d53.png&r=x
  urls: !ruby/hash:OmniAuth::AuthHash
    GitHub: https://github.com/avallabh
    Blog:
credentials: !ruby/hash:OmniAuth::AuthHash
  token: 0b8c9efb50a10a7a5fe78808319b82a9234acbe4
  expires: false
raw_info: !ruby/hash:OmniAuth::AuthHash
    login: avallabh
    id: 5490993
    avatar_url: https://gravatar.com/avatar/3ae55fc2791395e3b0d29046537ca68c?d=https%3A%2F%2Fidenticons.github.com%2F5e9435c7ae8aca56fb88f9dbc1ce7d53.png&r=x
    gravatar_id: 3ae55fc2791395e3b0d29046537ca68c
    url: https://api.github.com/users/avallabh
    html_url: https://github.com/avallabh
    followers_url: https://api.github.com/users/avallabh/followers
    following_url: https://api.github.com/users/avallabh/following{/other_user}
    gists_url: https://api.github.com/users/avallabh/gists{/gist_id}
    starred_url: https://api.github.com/users/avallabh/starred{/owner}{/repo}
    subscriptions_url: https://api.github.com/users/avallabh/subscriptions
    organizations_url: https://api.github.com/users/avallabh/orgs
    repos_url: https://api.github.com/users/avallabh/repos
    events_url: https://api.github.com/users/avallabh/events{/privacy}
    received_events_url: https://api.github.com/users/avallabh/received_events
    type: User
    site_admin: false
    public_repos: 20
    public_gists: 1
    followers: 3
    following: 0
    created_at: '2013-09-19T00:54:18Z'
    updated_at: '2014-01-10T16:23:22Z'
    private_gists: 47
    total_private_repos: 3
    owned_private_repos: 2
    disk_usage: 2890
    collaborators: 7
----------------
[
  {
    "login": "LaunchAcademy",
    "id": 3612691,
    "url": "https://api.github.com/orgs/LaunchAcademy",
    "repos_url": "https://api.github.com/orgs/LaunchAcademy/repos",
    "events_url": "https://api.github.com/orgs/LaunchAcademy/events",
    "members_url": "https://api.github.com/orgs/LaunchAcademy/members{/member}",
    "public_members_url": "https://api.github.com/orgs/LaunchAcademy/public_members{/member}",
    "avatar_url": "https://gravatar.com/avatar/3996dda93bb2ce2013929378c9ecff8d?d=https%3A%2F%2Fidenticons.github.com%2F4b3a0506bdae82443985db57027b99ba.png&r=x"
  }
]
=end

class SessionsController < ApplicationController

  # before do
  #   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  # end

  def index
  end

  def create

# gets the hash of ALL INFO
#    raise request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]

    user = User.find_or_create_by!(name: auth["info"]["name"], provider: auth["provider"], uid: auth["uid"]) #|| User.create_with_omniauth(auth)

    #user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path, notice: 'You have successfully signed in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You have successfully signed out!'
  end

  def failure
    redirect_to root_path, notice: 'Authentication Failed'
  end

end
