class GithubUserAttributes < ApiCachedAttributes::Base
  client { Octokit::Client.new }

  default_resource { |client, scope| client.user(scope[:github_login]) }

  attribute :id
  attribute :avatar_url
  attribute :url
  attribute :html_url
  attribute :type
  attribute :name
  attribute :company
  attribute :email
  attribute :public_repos
  attribute :updated_at
  attribute :created_at
end
