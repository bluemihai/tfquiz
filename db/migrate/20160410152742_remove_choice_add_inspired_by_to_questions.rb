class RemoveChoiceAddInspiredByToQuestions < ActiveRecord::Migration[5.0]
  def up
    remove_column :questions, :current_choice
    add_column :questions, :inspired_by, :string
  end

  def down
    add_column :questions, :current_choice, :boolean
    remove_column :questions, :inspired_by
  end
end
