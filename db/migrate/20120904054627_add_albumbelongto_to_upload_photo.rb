class AddAlbumbelongtoToUploadPhoto < ActiveRecord::Migration
  def self.up
    add_column :upload_photos, :albumbelongto, :string

  end

  def self.down
  	remove_column :upload_photos, :albumbelongto
  end
end
