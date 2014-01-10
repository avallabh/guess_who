require 'spec_helper'

feature 'user signs in', %Q{
  As an authenticated user
  I want to sign in
  So that I can access my account
} do

## ACCEPTANCE CRITERIA
# * If I attempt to sign in, redirect to GitHub
# * Authenicate with GitHub


  scenario 'user visits page and wants to sign in' do
    visit root_path
    click_on 'Sign In'

    expect(page).to have_content('Sign Out')

  end
end
