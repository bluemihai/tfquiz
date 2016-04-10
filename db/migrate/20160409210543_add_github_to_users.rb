class AddGithubToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :github_nickname, :string
    add_column :users, :github_avatar, :string
  end
end
