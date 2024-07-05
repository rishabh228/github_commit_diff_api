require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get commits" do
    get repositories_commits_url
    assert_response :success
  end

  test "should get diff" do
    get repositories_diff_url
    assert_response :success
  end

end
