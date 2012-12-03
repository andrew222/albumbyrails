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
end
