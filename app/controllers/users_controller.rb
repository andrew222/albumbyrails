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
        flash[:warning] = "Login unsuccessful"
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
        session[:current_user] = User.where(id: @user._id).first
        send_welcome_email(session[:current_user])
        redirect_to new_p_album_path
      else
        redirect_to :action => :signup
      end
    elsif request.get?
      @user = User.new()
    end
  end

  def send_welcome_email(user)
    UserMailer.welcome_email(user)
  end
end
