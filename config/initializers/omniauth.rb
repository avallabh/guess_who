require 'omniauth-github'
## stub testing -- start
OmniAuth.config.test_mode = true
GITHUB_INFO = {
  "id" => "234252",
  "email" => "awesome@github.com"
}
OmniAuth.config.mock_auth[:github] = {
  "uid" => '12345',
  "provider" => 'github',
  "user_info" => {"name" => "Santa Claus", "nickname" => "SCLAUS"},
  "credentials" => {"token" => 'plataformatec'},
  "extra" => {"user_hash" => "GITHUB_INFO"}
}
## stub testing -- end

OmniAuth.config.logger=Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'], :scope => 'user'
  #provider :githubteammember, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'], :scope => 'user'
end
