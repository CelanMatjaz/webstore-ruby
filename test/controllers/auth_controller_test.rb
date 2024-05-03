require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get show_login" do
    get auth_show_login_url
    assert_response :success
  end

  test "should get show_register" do
    get auth_show_register_url
    assert_response :success
  end

  test "should get login" do
    get auth_login_url
    assert_response :success
  end

  test "should get register" do
    get auth_register_url
    assert_response :success
  end

  test "should get logout" do
    get auth_logout_url
    assert_response :success
  end
end
