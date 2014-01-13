require 'spec_helper'

feature 'User adds a member', %Q{
  As an Admin
  I want to manage members
  So that I can keep information current
} do

  # ACCEPTANCE CRITERIA
  # *I can add, update, delete members
  # *When I add a member, a first name, last name, role, email, photo, and gender must be provided.
  # *I can optionally specify a cohort
  # *If my action is successful, I should see a notice to confirm
  # *If my action is not successful, I should see an error message.

  scenario 'with all required and valid attributes' do
    visit 'members/new'
    fill_in 'First Name',     with: 'John'
    fill_in 'Last Name',      with: 'Smith'
    fill_in 'Role',           with: 'Member'
    fill_in 'Email',          with: 'test@example.com'
    choose  'Male'
    click_on 'Create Member'


    expect(page).to have_content('Successfully created member')
    expect(page).to have_content('Member Profile')
    expect(page).to have_content('First Name')
    expect(page).to have_content('Last Name')
    expect(page).to have_content('Role')
    expect(page).to have_content('Email')
    expect(page).to have_content('Gender')
  end

  scenario 'with invalid or missing attributes' do
    visit 'members/new'
    click_on 'Create Member'

    expect(page).to_not have_content('Successfully created member')
    expect(page).to_not have_content('Member Profile')
    expect(page).to have_content('First name can\'t be blank')
    expect(page).to have_content('Last name can\'t be blank')
    expect(page).to have_content('Role is not included in the list')
    expect(page).to have_content('Email is not an email')
    expect(page).to have_content('Gender can\'t be blank')
  end

end
