require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # get data from test/fixtures/restaurants.yml
    @restaurant = restaurants(:one)
  end

  # 1. List Restaurants
  test "should get index" do
    get restaurants_url, as: :json
    assert_response :success
    assert_not_nil response.parsed_body
  end

  # 2. Create Restaurant
  test "should create restaurant" do
    assert_difference("Restaurant.count") do
      post restaurants_url,
           params: { name: "Resto Baru", address: "Bandung", phone: "123", opening_hours: "10-22" },
           as: :json
    end
    assert_response :created
  end

  # 3. Show Restaurant
  test "should show restaurant" do
    get restaurant_url(@restaurant), as: :json
    assert_response :success
    # Make sure to include menu items
    assert_includes response.parsed_body, "menu_items"
  end

  # 4. Update Restaurant
  test "should update restaurant" do
    put restaurant_url(@restaurant),
        params: { name: "Nama Updated" },
        as: :json
    assert_response :success
    @restaurant.reload
    assert_equal "Nama Updated", @restaurant.name
  end

  # 5. Delete Restaurant
  test "should destroy restaurant" do
    # since we do not put dependent: destroy on the model, we try to clean all menus first to avoid delete contraints error
    @restaurant.menu_items.destroy_all

    assert_difference("Restaurant.count", -1) do
      delete restaurant_url(@restaurant), as: :json
    end
    assert_response :success
  end

  # 6. Add Menu Item (Nested Route)
  test "should add menu item to restaurant" do
    assert_difference("MenuItem.count") do
      post add_menu_item_restaurant_url(@restaurant),
           params: { name: "Es Teh", description: "Segar", price: 5000, category: "drink" },
           as: :json
    end
    assert_response :created
  end

  # 7. List Menu Items with Filter
  test "should list menu items with category filter" do
    get list_menu_items_restaurant_url(@restaurant, category: "drink"),
        as: :json
    assert_response :success

    puts "DEBUG", response.parsed_body

    # Must have data and pagination attributes for paginated response
    assert_includes response.parsed_body, "data", "pagination"

    # Paginated response is likely an array
    assert_kind_of Array, response.parsed_body[:data]
  end
end
