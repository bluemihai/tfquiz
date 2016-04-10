class ChangeTFToText < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :t, :text
    change_column :questions, :f, :text
  end
end
