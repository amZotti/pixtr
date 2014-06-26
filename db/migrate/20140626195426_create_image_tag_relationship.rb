class CreateImageTagRelationship < ActiveRecord::Migration
  def change
    create_table :image_tag_relationships do |t|
      t.belongs_to :image, null: false
      t.belongs_to :tag, null: false 
      t.timestamps null: false
    end
    add_index :image_tag_relationships, [:image_id, :tag_id], unique: true
 end
end
