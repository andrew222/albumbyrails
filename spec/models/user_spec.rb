# spec/models/user.rb
require 'spec_helper'

describe User do
	before :each do
  	@user = FactoryGirl.create(:user)
	end

	after :each do
		@user.destroy
	end

  it "has a valid factory" do
  	FactoryGirl.create(:user).should be_valid
  end
  it "to_s should return the name of user" do
  	@user.to_s.should eql(@user.name)
  end
  it "is invalid without a email" do
  	FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  it "is invalid without a name" do
  	FactoryGirl.build(:user, name: nil).should_not be_valid
  end
  it "is invalid without a password" do
  	FactoryGirl.build(:user, password: nil).should_not be_valid
  end

  it "returns a hashed password" do
  	@user.hashed_password.should_not eql(@user.password)
  end
  it "should be 10 lenght of salt" do
  	@user.salt.length == 10 
  end  	
  it "should be can login use name and password" do
  	@user.hashed_password.should eql(User.authenticate(@user.name, @user.password).hashed_password)
  end
end

