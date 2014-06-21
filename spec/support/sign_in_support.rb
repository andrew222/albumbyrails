#module for helping controller specs
module ValidUserHelper
  def signed_in_as_a_valid_user
    @user = FactoryGirl.create(:user, :name => "test", :email => 'test@ekohe.com', :password => "test@ekohe.com")
    visit '/'

    fill_in "user_name", with: "test"
    fill_in "user_password", with: "test@ekohe.com"
    click_button "commit"
  end
end

RSpec.configure do |config|
  config.include ValidUserHelper, :type => :request
  config.include ValidUserHelper, :type => :view
end