require "test_helper"

class Account::AddressControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get account_address_show_url
    assert_response :success
  end

  test "should get show_create" do
    get account_address_create_url
    assert_response :success
  end

  test "should get show_update" do
    get account_address_edit_url
    assert_response :success
  end
end
