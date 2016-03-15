class RemoveApiColumnsFromGithubUser < ActiveRecord::Migration
  def change
    change_table :github_users do |t|
      t.remove :github_id
      t.remove :avatar_url
      t.remove :url
      t.remove :html_url
      t.remove :type
      t.remove :name
      t.remove :company
      t.remove :email
      t.remove :public_repos
      t.remove :github_created_at
      t.remove :github_updated_at
    end
  end
end
