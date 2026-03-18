class RestaurantsController < ApplicationController
  include RestaurantPermittable
  include MenuItemPermittable

  def create
    restaurant = Restaurant.create!(restaurant_params)
    render json: restaurant, status: :created
  end

  def index
    restaurants = Restaurant.all
    render json: paginate(restaurants), status: :ok
  end

  def show
    restaurant = Restaurant.includes(:menu_items).find(params[:id])
    render json: restaurant.as_json(include: :menu_items), status: :ok
  end

  def update
    restaurant = Restaurant.find(params[:id])
    restaurant.update!(restaurant_params)
    render json: restaurant, status: :ok
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy!
    render json: { message: "Restaurant with id #{params[:id]} deleted successfully" }, status: :ok
  end

  def add_menu_item
    restaurant = Restaurant.find(params[:id])
    menu_item = restaurant.menu_items.create!(menu_item_params)
    render json: menu_item, status: :created
  end

  def list_menu_items
    restaurant_with_menu_items = Restaurant.includes(:menu_items).find(params[:id])

    menu_items = restaurant_with_menu_items.menu_items
    menu_items = menu_items.where(category: params[:category]) if params[:category].present?
    menu_items = menu_items.where("name LIKE ?", "%#{params[:name]}%") if params[:name].present?

    render json: paginate(menu_items), status: :ok
  end
end
