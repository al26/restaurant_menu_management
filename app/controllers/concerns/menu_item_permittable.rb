module MenuItemPermittable
  extend ActiveSupport::Concern

  private

  def menu_item_params
    params.permit(:name, :description, :price, :category, :is_available)
  end
end
