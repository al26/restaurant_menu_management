require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  test "name and address are required" do
    restaurant = Restaurant.new()
    assert_not restaurant.save, "Restaurant name and address are required"
  end
end
