module ApiExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotDestroyed, with: :record_not_destroyed
  end

  private

  def record_not_found(error)
    model_name = error.model.underscore.humanize

    message = model_name.present? ? "#{model_name} not found" : "Record not found"
    render json: { error: message, detail: error.message }, status: :not_found
  end

  def record_invalid(error)
    render json: { error: "Validation failed", detail: error.record.errors.full_messages }, status: :unprocessable_entity
  end

  def record_not_destroyed(error)
    render json: { error: "Could not delete record", detail: error.record.errors.full_messages }
  end
end
