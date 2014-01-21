require 'spec_helper'

feature 'user signs in', %Q{
  As an authenticated user
  I want to sign in
  So that I can access my account
} do

## ACCEPTANCE CRITERIA
# * If I attempt to sign in, redirect to GitHub
# * Authenicate with GitHub

  before do
    OmniAuth.config.test_mode = true
  end

  scenario 'can do so successfully and authentication succeeds' do
    OmniAuth.config.add_mock :github, uid: "12345", info: { name: "James Bond", nickname: 'jbond' }

    visit root_path
    click_link 'Sign In With GitHub'

    expect(page).to have_content "Signed In as James Bond"
  end

  scenario 'fails to do so when authentication fails' do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    OmniAuth.config.on_failure = Proc.new { |env|
        OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    }

    visit root_path
    click_link 'Sign In With GitHub'

    expect(page).to have_content "Authentication Failed"
  end

end
