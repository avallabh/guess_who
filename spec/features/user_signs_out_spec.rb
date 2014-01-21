require 'spec_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out
  So that I can secure my account.
} do

## ACCEPTANCE CRITERIA
# * When authenticated I should see a link to sign out.
# * When signed out I cannot access the game or add new members.
# * I must see a link to sign in.

  before do
    OmniAuth.config.test_mode = true
  end

  scenario 'can do so successfully and sign out succeeds' do
    OmniAuth.config.add_mock :github, uid: "12345", info: { name: "James Bond", nickname: 'jbond' }

    visit root_path
    click_link 'Sign In With GitHub'
    click_link 'Sign Out'

    expect(page).to have_content "You have successfully signed out!"
    expect(page).to have_content "Sign In With GitHub"
    expect(page).to_not have_content "Add Member"
    expect(page).to_not have_content "Play Game"
  end
end
