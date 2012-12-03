class CreateUploadPhotos < ActiveRecord::Migration
  def up
    create_table :upload_photos do |t|
      t.string :title
      t.text :description
      t.string :photoURL
      t.string :albumBelongTo

      t.timestamps
    end
  end
  
  def down
    drop_table :upload_photos
  end
end
