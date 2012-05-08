class AddUserIdToUploadPhoto < ActiveRecord::Migration
  def change
    add_column :upload_photos, :user_id, :integer

  end
end
