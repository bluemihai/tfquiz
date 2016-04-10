class AddCurrentChoiceToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :current_choice, :boolean, default: true
  end
end
