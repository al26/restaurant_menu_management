class MenuItemsController < ApplicationController
  include MenuItemPermittable

  def update
    menu_item = MenuItem.find(params[:id])
    menu_item.update!(menu_item_params)
    render json: menu_item, status: :ok
  end

  def destroy
    menu_item = MenuItem.find(params[:id])
    menu_item.destroy!
    render json: { message: "Menu item with id #{params[:id]} deleted successfully" }, status: :ok
  end
end
