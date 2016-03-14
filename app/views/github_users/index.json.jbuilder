json.array!(@github_users) do |github_user|
  json.extract! github_user, :id, :github_login, :github_id, :avatar_url, :url, :html_url, :type, :name, :company, :email, :public_repos, :github_created_at, :github_updated_at
  json.url github_user_url(github_user, format: :json)
end
