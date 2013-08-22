class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @upload_photos = UploadPhoto.where(id: @user.id)
  end
  
  def destroy
    # current_user = nil
  end

  def login
    if request.post?
      options = params[:user]
      if session[:current_user] = User.authenticate(options[:name], options[:password])
        flash[:message] = 'Log in successful'
        redirect_to new_p_album_path
      else
        flash[:error] = "Login unsuccessful"
        redirect_to :action => :login
      end
    end
  end

  def logout
    session[:current_user] = nil
    redirect_to :action => :login
  end

  def signup
    if request.post?
      options = params[:user]
      @user = User.new({
        name: options[:name],
        password: options[:password],
        email: options[:email]
        })
      if @user.save
        flash[:message] = "Register in successful.Please checkout your email."
        Resque.enqueue(SendEmailJob, "welcome", @user._id)
        redirect_to login_path
      else
        flash[:error] = check_validata(@user)
        redirect_to :action => :signup
      end
    elsif request.get?
      @user = User.new()
    end
  end

  def check_validata(user)
    errors = user.errors
    if errors[:email].size > 0
      "Email: '#{user.email}' " + errors[:email].first
    elsif errors[:name].size > 0
      "Name: '#{user.name}' " + errors[:name].first
    elsif errors[:password].size > 0
      "Password: '#{user.password}' " + errors[:password].first
    end
  end
end
