module UploadPhotosHelper
  def allAlbum
    @albums = PAlbum.where(id: current_user.id)
      @arrAlbums=[]
      i=0
      @albums.each do |album|
        @arrAlbums[i]=album.album_name
        i=i+1
      end
  end
end
