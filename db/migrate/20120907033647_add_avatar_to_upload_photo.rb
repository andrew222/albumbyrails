class AddAvatarToUploadPhoto < ActiveRecord::Migration
  def self.up
    add_column :upload_photos, :avatar, :string

  end
  
  def self.down
  	remove_column :upload_photos, :avatar
  end
end
