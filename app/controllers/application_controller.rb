class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end
end
