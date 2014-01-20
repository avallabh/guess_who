require 'spec_helper'

feature 'User plays the game' do

  scenario 'user tries to play game when not signed in' do
    visit root_path
    uri = URI.parse(current_url)
    click_link 'Play Game'

    "#{uri.path}".should == root_path
    expect(page).to have_content('Must be signed in to play.')

  end

  scenario 'when making the first guess' do

    members = FactoryGirl.create_list(:member, 4)
    member_fullname = members.map {|x| "#{x.first_name} #{x.last_name}" }
    correct_member = member_fullname.first
    visit root_path

    click_on 'Play Game'
    save_and_open_page
    click_link correct_member

    expect(page).to have_content('Right on playa')
    expect(members.count).to eq(4)
    expect(page).to_not have_content("don't you know")
  end

  scenario 'after making a correct guess'

  scenario 'after making an incorrect guess'

end
