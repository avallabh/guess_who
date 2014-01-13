require 'spec_helper'

describe Member do
  describe 'validations' do
    let(:member){FactoryGirl.create(:member)}

    it 'is valid when it has all required and valid attributes' do
      expect(member).to be_valid
    end
  end


  it {should have_valid(:first_name).when('John')}
  it {should_not have_valid(:first_name).when('', nil)}
  it {should have_valid(:last_name).when('Smith')}
  it {should_not have_valid(:last_name).when('', nil)}
  it {should have_valid(:role).when('Member')}
  it {should have_valid(:role).when('Admin')}
  it {should_not have_valid(:role).when('abcs', 123, nil, '')}
  it {should have_valid(:email).when('johnsmith@launchacademy.com')}
  it {should_not have_valid(:email).when('', nil, 'abc123')}
  it {should have_valid(:gender).when('Male')}
  it {should have_valid(:gender).when('Female')}
  it {should_not have_valid(:gender).when('', nil)}
  it {should_not have_valid(:gender).when('xaheqfldj')}

  #it {should belong_to :user}
  it {should have_many :member_informations}
end
