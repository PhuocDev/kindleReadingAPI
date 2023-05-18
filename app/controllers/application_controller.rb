class ApplicationController < ActionController::API
  include SessionHelper
  before_action :authenticate_request

  private

  def authenticate_request
    render json: { error: 'Not authorized' }, status: 401 unless logged_in?
  end
end
