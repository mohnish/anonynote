class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string "title", :limit => 100, :null => false
      t.text "content", :null => false
      t.string "url", :null => false, :limit => 6
      t.timestamps
    end
  end
  
  def self.down
    drop_table :contents
  end
  
end
