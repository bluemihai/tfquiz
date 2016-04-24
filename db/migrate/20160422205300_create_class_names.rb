class CreateClassNames < ActiveRecord::Migration[5.0]
  def change
    create_table :class_names do |t|
      t.string :name
      t.integer :group
      t.string :attributez
      t.string :methodz

      t.timestamps
    end
  end
end
