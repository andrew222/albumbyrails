module ApplicationHelper
  
  def allAlbum
    @albums = PAlbum.where(user_id: current_user.id)
    arrAlbums = []
    @albums.each do |album|
      arrAlbums << album.album_name
    end
    return arrAlbums
  end
end
