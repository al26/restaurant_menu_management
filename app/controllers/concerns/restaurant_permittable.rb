module RestaurantPermittable
  extend ActiveSupport::Concern

  private

  def restaurant_params
    params.permit(:name, :address, :phone, :opening_hours)
  end
end
