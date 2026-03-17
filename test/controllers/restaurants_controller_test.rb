require "test_helper"

class RestaurantControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restaurant_index_url
    assert_response :success
  end

  test "should get create" do
    get restaurant_create_url
    assert_response :success
  end

  test "should get show" do
    get restaurant_show_url
    assert_response :success
  end

  test "should get update" do
    get restaurant_update_url
    assert_response :success
  end

  test "should get destroy" do
    get restaurant_destroy_url
    assert_response :success
  end

  test "should get add_menu_item" do
    get restaurant_add_menu_item_url
    assert_response :success
  end

  test "should get get_menu_item" do
    get restaurant_get_menu_item_url
    assert_response :success
  end
end
