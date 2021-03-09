class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[user_nickname user_profile avatar store_nickname address building
                                               phone_number store_profile])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[user_nickname user_profile avatar store_nickname address building
                                               phone_number store_profile])
  end
end
