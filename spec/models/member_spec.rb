require 'spec_helper'

describe Member do

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
  it {should have_many :identities}
end
