require 'spec_helper'

feature 'User plays the game' do

  scenario 'user tries to play game when not signed in' do
    # visit root_path
    # uri = URI.parse(current_url)
    visit games_path

    current_path.should == root_path
    expect(page).to have_content('Must be signed in to play.')

  end
before do
    OmniAuth.config.test_mode = true
end
  scenario 'authenticated user loads game initially' do
OmniAuth.config.add_mock :github, uid: "12345", info: { name: "James Bond", nickname: 'jbond' }
    member1 = FactoryGirl.create(:member, first_name: 'John1', last_name: 'Smith1', id: 1)
    member2 = FactoryGirl.create(:member, first_name: 'John2', last_name: 'Smith2', id: 2)
    member3 = FactoryGirl.create(:member, first_name: 'John3', last_name: 'Smith3', id: 3)
    member4 = FactoryGirl.create(:member, first_name: 'John4', last_name: 'Smith4', id: 4)
#   member_fullname = members.map {|x| "#{x.first_name} #{x.last_name}" }
#   correct_member = member_fullname.first
    visit root_path
    click_link 'Sign In With GitHub'

    click_on 'Play Game'


    #click_link correct_member

    expect(page).to have_content("#{member1.first_name}")
    expect(page).to have_content("#{member1.last_name}")
    expect(page).to have_content("#{member2.first_name}")
    expect(page).to have_content("#{member2.last_name}")
    expect(page).to have_content("#{member3.first_name}")
    expect(page).to have_content("#{member3.last_name}")
    expect(page).to have_content("#{member4.first_name}")
    expect(page).to have_content("#{member4.last_name}")
    expect(page).to have_content("Add Member")
    expect(page).to have_content("Sign Out")
#    expect(page).to have_content('right on playa')
#    expect(members.count).to eq(4)
#    expect(page).to_not have_content("don't you know")
end

scenario 'after making a correct guess'

scenario 'after making an incorrect guess'

end
