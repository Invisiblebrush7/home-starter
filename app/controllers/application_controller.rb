class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    keys = [:shipping_address, :first_name, :last_name, :email, :phone_number]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
  end
end
