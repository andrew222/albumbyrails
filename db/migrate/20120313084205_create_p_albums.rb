class CreatePAlbums < ActiveRecord::Migration
  def up
    create_table :p_albums do |t|
      t.string :album_name
      t.text :album_description

      t.timestamps
    end
  end
  
  def down
    drop_table :p_albums
  end
end
