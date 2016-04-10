class CreateQuestionSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :question_selections do |t|
      t.integer :question_id
      t.integer :quiz_id
      t.boolean :display_t_or_f

      t.timestamps
    end
  end
end
