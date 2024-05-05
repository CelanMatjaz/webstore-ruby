require "test_helper"

class ProductGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get product_group_show_url
    assert_response :success
  end
end
