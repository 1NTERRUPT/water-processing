require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should load monitor by default" do
    get root_url
    assert_response :success
    assert_select '.title', 'Monitor'
  end

  test "should show the operator page to operators" do
    sign_in User.where(username: 'operator').first

    get root_url
    assert_select '.title', 'Operator'
  end

  test "should show the admin page to admins" do
    sign_in User.where(username: 'admin').first

    get root_url
    assert_select '.title', 'Administrator'
  end
end
