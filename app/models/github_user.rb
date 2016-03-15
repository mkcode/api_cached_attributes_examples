class GithubUser < ActiveRecord::Base
  validates :github_login, presence: true, uniqueness: true

  api_cached_attributes :github_user, scope: :github_login,
    attributes_map: { id: :github_id, updated_at: :github_updated_at,
                      created_at: :github_created_at }
end
