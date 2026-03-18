class ApplicationController < ActionController::API
  include ApiExceptionHandler
  include Pagy::Method

  private

  def paginate(collection)
    @pagy, data = pagy(:offset, collection)
    {
      data: data,
      pagination: @pagy.data_hash(data_keys: [ :page, :previous, :next, :count, :previous_url, :next_url ])
    }
  end
end
