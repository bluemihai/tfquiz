class RemoveTopics < ActiveRecord::Migration[5.0]
  def up
    drop_table :topics
    remove_column :questions, :topic_id
    remove_column :quizzes, :topic_id
  end

  def down
    create_table :topics do |t|
      t.string :name
      t.string :domain

      t.timestamps
    end
    add_column :questions, :topic_id, :integer
    add_column :quizzes, :topic_id, :integer
  end
end
