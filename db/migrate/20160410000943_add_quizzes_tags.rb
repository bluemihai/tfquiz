class AddQuizzesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes_tags do |t|
      t.integer :quiz_id
      t.integer :tag_id
    end
  end
end
