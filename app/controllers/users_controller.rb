class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @upload_photos = UploadPhoto.where(id: @user.id)
  end
  
  def destroy
    current_user = nil
  end

  def login
    if request.post?
      options = params[:user]
      if session[:current_user] = User.authenticate(options[:name], options[:password])
        flash[:message] = 'Log in successful'
        redirect_to '/p_albums/new'
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
      @user = User.create({
        name: options[:name],
        password: options[:password],
        email: options[:email],
        password: options[:password]
        })
      session[:current_user] = @user
      redirect_to "/p_albums/new"
    end
  end
end
