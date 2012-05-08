# encoding: utf-8 
class HomeController < ApplicationController
  def index
    @action_name ="创建"
  end
  
  def create
    @upload_photo = UploadPhoto.new(params[:upload_photo])
    
    @upload_photo.photoURL=uploadPhoto(@upload_photo.photoURL);

    respond_to do |format|
      if @upload_photo.save
        format.html { redirect_to @upload_photo, :notice => '照片上传成功。' }
        format.json { render :json => @upload_photo, :status => :created, :location => @upload_photo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @upload_photo.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new
    @upload_photo = UploadPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @upload_photo }
    end
  end
end
