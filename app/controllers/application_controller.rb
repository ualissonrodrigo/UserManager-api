class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def render_success(status, message, data = nil)
    response = {
      success: true,
      message: [message]
    }
    response = response.merge(data) if data
    render json: response, status: status
  end

  def render_error(status, message, data = nil)
    response = {
      success: false,
      errors: [message]
    }
    response = response.merge(data) if data
    render json: response, status: status
  end
end
