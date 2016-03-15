# README

Example application for [api_cached_attributes](https://github.com/mkcode/api_cached_attributes).

## Install

This is a standard Rails 4.2 application using sqlite.

```sh
git clone git@github.com:mkcode/api_cached_attributes_examples.git
cd api_cached_attributes_examples
bundle install
bin/rake db:migrate

bin/rails console

 # or

bin/rails server
```

## Play

 1. Start a server and navigate to `locahhost:3000/github_users`. A standard rails scaffolding is here.
 2. Click on 'New Github User'.
 3. Enter a user's github identifier (their github username).
 4. Watch the auto-population magic

## Learn

The [commit log](https://github.com/mkcode/api_cached_attributes_examples/commits/master) in this application is very concise and minimal. Please look through it and see how this example was created.

The meat and potatoes are as follows:

In `app/api_attributes/github_user_attributes`:

```ruby
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
```

We define a number of attributes that are part of the github v3 user API. See: https://developer.github.com/v3/users/#get-a-single-user

The scope is sent into both the client and the resource blocks. In this case, we are using an anonymous client and simply using the `github_login` scope as the paramater to the `user` endpoint. In a more advanced example (not shown), we may use a user's oauth_token as the scope create an authenticated client from that.

Then, in `app/models/github_user`:

```ruby
class GithubUser < ActiveRecord::Base
  validates :github_login, presence: true, uniqueness: true

  api_cached_attributes :github_user, scope: :github_login,
    attributes_map: { id: :github_id, updated_at: :github_updated_at,
                      created_at: :github_created_at }
end
```

We call __api_cached_attributes__ to include the previously defined attributes in the GithubUser model to create a hybrid domain object. This is partially backed by the database, and partially backed by the Github API.

We __scope: github_login__ option, collects the value of github_login on this model and sends this into the GithubUserAttributes class to make a unique client and resource. It does not need to be persisted (saved) to work.

The __attribues_map__ option, overrides the default method names on GithubUser. Because the model already has an id, updated_at, and created_at, we prefix the github api values with github. A `prefix` option is also available if all the defined methods shoudl be prefixed as well.

The __validates__ line is not needed, but helps. Trying to access the attributes without a github_login set, will cause an error. And in this table, conceptually, it makes sense for one record per user, which is why we validate uniqueness as well.
