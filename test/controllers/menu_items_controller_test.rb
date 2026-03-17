require "test_helper"

class MenuItemControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get menu_item_update_url
    assert_response :success
  end

  test "should get delete" do
    get menu_item_delete_url
    assert_response :success
  end
end
