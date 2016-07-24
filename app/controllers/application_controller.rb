class ApplicationController < ActionController::Base
	respond_to :html, :json

  #acts_as_token_authentication_handler_for User

  protect_from_forgery with: :null_session

  #before_filter :authenticate_user!
  #skip_before_action :verify_authenticity_token, if: :json_request?

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :email])
  end

  protected

  def json_request?
    request.format.json?
  end
end
