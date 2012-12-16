require 'spec_helper'
describe UsersController do
	describe "GET #index" do
    it "populates an array of users" do
    	# user = FactoryGirl.create(:user)
    	# get :index
    	# assigns(:users).should eq([user])
    end
    it "renders the :index view" do 
    	# get :index
    	# response.should render_template :index
   	end
  end
  
  describe "GET #show" do
    it "assigns the requested user to @user" do
    	user = FactoryGirl.create(:user)
    	get :show, id: user
    	assigns(:user).should eq(user)
    end
    it "renders the :show template" do
    	get :show, id: FactoryGirl.create(:user)
    	response.should render_template :show
    end
  end
  
  describe "POST #signup" do
  	context "with valid attributes" do
	    it "assigns a new user to @user" do
	    	expect{
	    		post :signup, user: FactoryGirl.attributes_for(:user)
	    	}.to change(User, :count).by(1)
	    end
	    it "redirects to the /p_albums/new" do
	    	post :signup, user: FactoryGirl.attributes_for(:user)
	    	response.should redirect_to '/p_albums/new'
	    end
	    it "stroe @user to the session[:current_user]" do
      	user = FactoryGirl.attributes_for(:user)
      	post :signup, user: user
      	session[:current_user].name == user[:name]
      	session[:current_user].email == user[:email]
	    end
	   end

	  context "with invalid attributes" do
	   	it "doesn't signup" do
	   		expect{
	   			post :signup, user: FactoryGirl.attributes_for(:invalid_user)
	   		}.to_not change(User, :count)
	   	end

	   	it "re-renders the signup method" do
	   		post :signup, user: FactoryGirl.attributes_for(:invalid_user)
	   		response.should redirect_to :signup
	   	end
	  end
  end
  
  describe "POST #login" do
    context "with valid attributes" do
      it "stroe user in session[:current_user]" do
      	user = FactoryGirl.attributes_for(:user)
      	post :signup, user: user
      	post :logout
      	post :login, user: user
      	session[:current_user].name.should eql(user[:name])
      	session[:current_user].email.should eql(user[:email])
      end
      it "redirects to the /p_albums/new" do
      	user = FactoryGirl.attributes_for(:user)
      	post :signup, user: user
      	post :logout
      	post :login, user: user
      	response.should redirect_to '/p_albums/new'
      end
    end
    
    context "with invalid attributes" do
      it "re-direct the :login" do
      	user = FactoryGirl.attributes_for(:invalid_user)
      	post :login, user: user
      	response.should redirect_to :login
      end
    end
  end

  describe "POST #login" do
  	it 'should be null session[:current_user]' do
  		user = FactoryGirl.attributes_for(:user)
  		post :login, user: user
  		post :logout
  		session[:current_user].should be_nil
  	end
  	it 'should re-direct to login' do
  		user = FactoryGirl.attributes_for(:user)
  		post :login, user: user
  		post :logout
  		response.should redirect_to :login
  	end
  end
end