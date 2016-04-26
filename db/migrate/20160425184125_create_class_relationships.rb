class CreateClassRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :class_relationships do |t|
      t.integer :primary_id
      t.integer :secondary_id
      t.integer :class_rel
      t.integer :object_rel

      t.timestamps
    end
  end
end
