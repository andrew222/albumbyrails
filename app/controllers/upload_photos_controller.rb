# encoding: utf-8 
class UploadPhotosController < ApplicationController
  # GET /upload_photos
  # GET /upload_photos.json
  before_filter :authenticate_user!, :except => [:index,
                                             :show]
  
  before_filter :find_photo, :only => [:show, :edit, :update, :destroy]
  
  def index
    @upload_photos = UploadPhoto.where(user_id: current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @upload_photos }
    end
  end

  # GET /upload_photos/1
  # GET /upload_photos/1.json
  def show
    @comment = @upload_photo.comments.build
  end

  # GET /upload_photos/new
  # GET /upload_photos/new.json
  def new
    @action_name ="上传"
    @upload_photo = UploadPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @upload_photo }
    end
  end

  # GET /upload_photos/1/edit
  def edit
    @action_name ="修改"
  end

  # POST /upload_photos
  # POST /upload_photos.json
  def create
    album = find_album(params[:upload_photo][:albumBelongTo]).first
    options = params[:upload_photo]
    @upload_photo = album.upload_photos.create(
        title: options[:title],
        description: options[:description],
        photoURL: uploadPhoto(options[:photoURL]),
        albumBelongTo: options[:albumBelongTo],
        user_id: current_user.id
    )
    respond_to do |format|
      format.html { redirect_to @upload_photo, :notice => '照片上传成功。' }
      format.json { render :json => @upload_photo, :status => :created, :location => @upload_photo }
    end
  end

  # PUT /upload_photos/1
  # PUT /upload_photos/1.json
  def update
    if @upload_photo.user_id == current_user.id
      respond_to do |format|
        if @upload_photo.update_attributes(params[:upload_photo])
          format.html { redirect_to @upload_photo, :notice => '照片信息已经成功更新。' }
          format.json { head :no_content }
          #end
        else
          format.html { render :action => "edit" }
          format.json { render :json => @upload_photo.errors, :status => :unprocessable_entity }
        end
      end
    else
       redirect_to @upload_photo, :notice => '没有权限！'
    end
  end

  # DELETE /upload_photos/1
  # DELETE /upload_photos/1.json
  def destroy
    @upload_photo.destroy
    delPhoto(@upload_photo.photoURL)

    respond_to do |format|
      format.html { redirect_to upload_photos_url }
      format.json { head :no_content }
    end
  end
  
  def find_photo
    @upload_photo = UploadPhoto.find(params[:id])
  end
  
  def uploadPhoto(file)
    fileName=file.original_filename
    if !fileName.empty?
      FileUtils.mkdir($uploadFolder) unless File.exist?($uploadFolder)
      File.open($uploadFolder+"/#{fileName}", "wb") do |f|
        f.write(file.read)
      end
      return fileName
    end
  end
  
  def delPhoto(filename)
    if !filename.empty?
      FileUtils.rm($uploadFolder+"/"+filename)
    end
  end
  
  def checkFileType(fileName)
    if fileName =~ /.jpg/
      return true
    else
      return false
    end
  end
  
  def find_album(album_name)
    return PAlbum.where(album_name: album_name)
  end
end
