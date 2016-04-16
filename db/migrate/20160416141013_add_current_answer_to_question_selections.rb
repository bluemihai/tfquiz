class AddCurrentAnswerToQuestionSelections < ActiveRecord::Migration[5.0]
  def change
    add_column :question_selections, :current_answer, :boolean
  end
end
