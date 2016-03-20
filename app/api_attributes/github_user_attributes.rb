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

  def markdown_summary
    client.markdown <<-MARKDOWN
# @#{name}

Has __#{public_repos}__ public repos and works for #{company}.

:rocket:
MARKDOWN
  end

  def available_methods
    resource(:default).methods(false)
  end
end
