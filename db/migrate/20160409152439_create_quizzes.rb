class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.integer :user_id
      t.boolean :custom
      t.integer :topic_id
      t.integer :question_count

      t.timestamps
    end
  end
end
