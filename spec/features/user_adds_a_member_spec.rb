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
  # *I must include a photo of the member.
  # *It must be jpg, png, or gif.

  scenario 'with all required and valid attributes' do
    visit 'members/new'
    fill_in 'First Name',     with: 'John'
    fill_in 'Last Name',      with: 'Smith'
    fill_in 'Role',           with: 'Member'
    fill_in 'Email',          with: 'test@example.com'
    choose  'member_gender_male'
    attach_file 'Member Photo', Rails.root.join('spec/file_fixtures/myphoto.jpg')
    click_on 'Create Member'


    expect(page).to have_content('Successfully created member')
    expect(page).to have_content('Sign In With GitHub')
    expect(page).to have_content('Add Member')
    expect(page).to have_content('Play Game')

    expect(Member.last.photo_url.url).to be_present
  end

  scenario 'with invalid or missing attributes' do
    visit 'members/new'
    attach_file 'Member Photo', Rails.root.join('spec/file_fixtures/wrongphoto.zsf')
    click_on 'Create Member'

    expect(page).to_not have_content('Successfully created member')
    expect(page).to_not have_content('Member Profile')
    expect(page).to have_content('First name can\'t be blank')
    expect(page).to have_content('Last name can\'t be blank')
    expect(page).to have_content('Role is not included in the list')
    expect(page).to have_content('Email is not an email')
    expect(page).to have_content('Gender can\'t be blank')
    expect(page).to have_content('You are not allowed to upload "zsf" files, allowed types: jpg, jpeg, gif, png')
  end

end
