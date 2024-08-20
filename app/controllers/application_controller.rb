class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitise.permit(:sign_up, keys:[:first_name, :last_name, :phone_number, :location, :children, :pets])
    devise_parameter_sanitise.permit(:account_update, keys:[:first_name, :last_name, :phone_number, :location, :children, :pets])
  end
end
