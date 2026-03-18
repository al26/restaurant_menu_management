require "test_helper"

class MenuItemTest < ActiveSupport::TestCase
  test "name and price are required" do
    menu_item = MenuItem.new()
    assert_not menu_item.save, "Menu name and price are required"
  end

  test "must belongs to restaurant" do
    menu_item = MenuItem.new(name: "Nasi Goreng", price: 15000, restaurant: nil)
    assert_not menu_item.valid?
    # Memastikan pesan error-nya tepat
    assert_includes menu_item.errors[:restaurant], "must exist"
  end
end
