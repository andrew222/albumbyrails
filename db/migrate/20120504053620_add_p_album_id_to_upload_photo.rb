class AddPAlbumIdToUploadPhoto < ActiveRecord::Migration
  def change
    add_column :upload_photos, :p_album_id, :integer

  end
end
