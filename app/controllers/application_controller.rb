class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:edit, keys: [:photo, :first_name, :last_name,
      :address, :user_description, :is_owner])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :email, :first_name, :last_name,
      :address, :user_description, :is_owner])
  end
end
