class CreateMulitFiles < ActiveRecord::Migration
  def up
    create_table :mulit_files do |t|

      t.timestamps
    end
  end
  
  def down
    drop_table :mulit_files
  end
end
