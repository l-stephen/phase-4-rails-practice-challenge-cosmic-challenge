class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :not_found_r
rescue_from ActiveRecord::RecordInvalid, with: :not_valid_r
private

def not_found_r(e)
    render json: { error: "#{e.model} not found"}, status: :not_found
end

def not_valid_r(e)
    render json: { errors: e.record.errors.full_messages}, status: :unprocessable_entity
end

end
