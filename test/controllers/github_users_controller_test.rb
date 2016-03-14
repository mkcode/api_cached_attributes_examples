require 'test_helper'

class GithubUsersControllerTest < ActionController::TestCase
  setup do
    @github_user = github_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:github_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create github_user" do
    assert_difference('GithubUser.count') do
      post :create, github_user: { avatar_url: @github_user.avatar_url, company: @github_user.company, email: @github_user.email, github_created_at: @github_user.github_created_at, github_id: @github_user.github_id, github_login: @github_user.github_login, github_updated_at: @github_user.github_updated_at, html_url: @github_user.html_url, name: @github_user.name, public_repos: @github_user.public_repos, type: @github_user.type, url: @github_user.url }
    end

    assert_redirected_to github_user_path(assigns(:github_user))
  end

  test "should show github_user" do
    get :show, id: @github_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @github_user
    assert_response :success
  end

  test "should update github_user" do
    patch :update, id: @github_user, github_user: { avatar_url: @github_user.avatar_url, company: @github_user.company, email: @github_user.email, github_created_at: @github_user.github_created_at, github_id: @github_user.github_id, github_login: @github_user.github_login, github_updated_at: @github_user.github_updated_at, html_url: @github_user.html_url, name: @github_user.name, public_repos: @github_user.public_repos, type: @github_user.type, url: @github_user.url }
    assert_redirected_to github_user_path(assigns(:github_user))
  end

  test "should destroy github_user" do
    assert_difference('GithubUser.count', -1) do
      delete :destroy, id: @github_user
    end

    assert_redirected_to github_users_path
  end
end
