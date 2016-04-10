class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :t
      t.string :f
      t.integer :topic_id
      t.string :domain, default: 'coding'
      t.text :public_comments
      t.text :private_comments
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
