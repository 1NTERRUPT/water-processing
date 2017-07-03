require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get monitor" do
    get home_monitor_url
    assert_response :success
  end

  test "should get operate" do
    get home_operate_url
    assert_response :success
  end

  test "should get administrate" do
    get home_administrate_url
    assert_response :success
  end

end
