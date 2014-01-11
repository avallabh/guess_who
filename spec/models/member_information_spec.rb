require 'spec_helper'

describe MemberInformation do
    let(:member_information){FactoryGirl.build(:member_information)}

    it 'is valid when it has all required and valid attributes' do
      expect(member_information).to be_valid
    end

  it {should have_valid(:key).when('github')}
  it {should_not have_valid(:key).when('', nil, 'abc')}
  it {should have_valid(:value).when('https://github.com/john')}
  it {should_not have_valid(:value).when('', nil)}

  it {should belong_to :member}
end
