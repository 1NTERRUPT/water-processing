require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should load monitor by default" do
    get root_url
    assert_response :success
    assert_select '.navbar-brand', 'Water Processing - Monitor'
  end

  test "should show the operator page to operators" do
    sign_in User.where(username: 'operator').first

    get root_url
    assert_select '.navbar-brand', 'Water Processing - Operator'
  end

  test "should allow an operator to update" do
    sign_in User.where(username: 'operator').first

    post control_pump_url, { pump_status: { operating_at: 80 } }

    assert_redirected_to root_url
  end
end
