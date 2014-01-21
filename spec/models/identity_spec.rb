require 'spec_helper'

describe Identity do
    let(:identity){FactoryGirl.build(:identity)}

    it 'is valid when it has all required and valid attributes' do
      expect(identity).to be_valid
    end

  # it {should have_valid(:key).when('github')}
  # it {should_not have_valid(:key).when('', nil, 'abc')}
  it {should have_valid(:value).when('https://github.com/john')}
  it {should_not have_valid(:value).when('', nil)}

  it {should belong_to :member}

  # describe 'url' do
  #   it 'generates service-specific urls' do
  #     m = FactoryGirl.build(:github)
  #     expect(m.get_url).to eq(
  #       "http://github.com/"+m.value
  #       )
  #   end
  # end

end
