class CreateGithubUsers < ActiveRecord::Migration
  def change
    create_table :github_users do |t|
      t.string :github_login
      t.integer :github_id
      t.string :avatar_url
      t.string :url
      t.string :html_url
      t.string :type
      t.string :name
      t.string :company
      t.string :email
      t.integer :public_repos
      t.datetime :github_created_at
      t.datetime :github_updated_at

      t.timestamps null: false
    end
  end
end
