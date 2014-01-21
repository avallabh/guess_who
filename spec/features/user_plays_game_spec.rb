require 'spec_helper'

feature 'User plays the game' do

  scenario 'user tries to play game when not signed in' do
    visit games_path

    current_path.should == root_path
    expect(page).to have_content('Must be signed in to play.')

  end
before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock :github, uid: "12345", info: { name: "James Bond", nickname: 'jbond' }
    visit root_path
    click_link 'Sign In With GitHub'
end
  scenario 'authenticated user loads game initially' do

    member1 = FactoryGirl.create(:member, first_name: 'John1', last_name: 'Smith1')
    member2 = FactoryGirl.create(:member, first_name: 'John2', last_name: 'Smith2')
    member3 = FactoryGirl.create(:member, first_name: 'John3', last_name: 'Smith3')
    member4 = FactoryGirl.create(:member, first_name: 'John4', last_name: 'Smith4')

    click_on 'Play Game'

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

end

  scenario 'after making a correct guess' do
    member1 = FactoryGirl.create(:member, first_name: 'John1', last_name: 'Smith1')
    member2 = FactoryGirl.create(:member, first_name: 'John2', last_name: 'Smith2')
    member3 = FactoryGirl.create(:member, first_name: 'John3', last_name: 'Smith3')
    member4 = FactoryGirl.create(:member, first_name: 'John4', last_name: 'Smith4')

    page.set_rack_session(:correct_guess_id => member1.id)
    visit games_path

    click_link "#{member1.full_name}"

    expect(page).to have_content('Good job! You guessed the correct name!')

  end

    scenario 'after making an incorrect guess' do
      member1 = FactoryGirl.create(:member, first_name: 'John1', last_name: 'Smith1')
      member2 = FactoryGirl.create(:member, first_name: 'John2', last_name: 'Smith2')
      member3 = FactoryGirl.create(:member, first_name: 'John3', last_name: 'Smith3')
      member4 = FactoryGirl.create(:member, first_name: 'John4', last_name: 'Smith4')

      page.set_rack_session(:correct_guess_id => member1.id)

      visit games_path

      click_link "#{member2.full_name}"

      save_and_open_page
      expect(page).to have_content('Oh no!  That is not the correct name, try again!')
    end

end
