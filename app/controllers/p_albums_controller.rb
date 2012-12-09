# encoding: utf-8 
class PAlbumsController < ApplicationController
  # GET /p_albums
  # GET /p_albums.json
  before_filter :login_required
  
  def index
    @p_albums = PAlbum.where(user_id: current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @p_albums }
    end
  end

  # GET /p_albums/1
  # GET /p_albums/1.json
  def show
    @p_album = PAlbum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @p_album }
    end
  end

  # GET /p_albums/new
  # GET /p_albums/new.json
  def new
    @p_album = PAlbum.new
    @action_name ="创建"

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render :json => @p_album }
    # end
  end

  # GET /p_albums/1/edit
  def edit
    @p_album = PAlbum.find(params[:id])
    @action_name ="修改"
  end

  # POST /p_albums
  # POST /p_albums.json
  def create
    @p_album = PAlbum.new(
      album_name: params[:p_album][:album_name],
      album_description: params[:p_album][:album_description],
      user_id: current_user.id
    )

    respond_to do |format|
      if @p_album.save
        format.html { redirect_to @p_album, :notice => '成功创建新相册' }
        format.json { render :json => @p_album, :status => :created, :location => @p_album }
      else
        format.html { render :action => "new" }
        format.json { render :json => @p_album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /p_albums/1
  # PUT /p_albums/1.json
  def update
    @p_album = PAlbum.find(params[:id])

    respond_to do |format|
      if @p_album.update_attributes(params[:p_album])
        format.html { redirect_to @p_album, :notice => '成功修改相册信息' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @p_album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /p_albums/1
  # DELETE /p_albums/1.json
  def destroy
    @p_album = PAlbum.find(params[:id])
    _delRecord(@p_album.album_name)
    @p_album.destroy

    respond_to do |format|
      format.html { redirect_to p_albums_url }
      format.json { head :no_content }
    end
  end
  
  def _delRecord(value)
    @photos=UploadPhoto.where(albumBelongTo: value)
    @photos.each do |photo|
      FileUtils.rm($uploadFolder+"/"+photo.photoURL)
      photo.destroy
    end
  end
  
end
