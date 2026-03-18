require "test_helper"

class MenuItemControllerTest < ActionDispatch::IntegrationTest
  setup do
    # get data from test/fixtures/menu_items.yml
    @menu_item = menu_items(:one)
  end

  # Test Update (PUT /menu_items/:id)
  test "should update menu item" do
    update_params = {
      name: "Es Pisang Ijo Updated",
      description: "Deskripsi baru dengan susu kental manis",
      price: 15000,
      category: "dessert"
    }

    put menu_item_url(@menu_item),
        params: update_params,
        as: :json

    assert_response :success

    @menu_item.reload
    assert_equal "Es Pisang Ijo Updated", @menu_item.name
    assert_equal 15000, @menu_item.price
  end

  # Test Delete (DELETE /menu_items/:id)
  test "should destroy menu item" do
    assert_difference("MenuItem.count", -1) do
      delete menu_item_url(@menu_item), as: :json
    end

    assert_response :success

    assert_equal "Menu item with id #{@menu_item.id} deleted successfully", response.parsed_body["message"]
  end

  # Test Skenario Gagal (Validation)
  test "should not update menu item with invalid data" do
    put menu_item_url(@menu_item),
        params: { name: "" },
        as: :json

    assert_response :unprocessable_entity
  end
end
