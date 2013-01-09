# spec/models/user.rb
require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it 'creates a new user account' do
    expect {
      FactoryGirl.create(:user)
    }.to change(User, :count).by(1)
  end

  it "has a valid factory" do
  	user.should be_valid
  end
  it "to_s should return the name of user" do
  	user.to_s.should eql(user.name)
  end
  it "is invalid without a email" do
  	user.email = nil
    user.should_not be_valid
  end
  it "is invalid without a name" do
  	user.name = nil
    user.should_not be_valid
  end
  it "is invalid without a password" do
  	user.password = ''
    user.should_not be_valid
  end
  its(:hashed_password) { user.hashed_password.should_not eql(user.password) }
  its(:salt) { user.salt.should have(10).characters } 	
  its(:hashed_password) { user.hashed_password.should eql(User.authenticate(user.name, user.password).hashed_password) }
end

