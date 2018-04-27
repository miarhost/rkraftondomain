class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_sanitized_parameters, if: :devise_controller?
  before_action :set_i18n_locale_from_params


protected 

def set_i18n_locale_from_params
	if params[:locale]
		if I18n.available_locales.map(&:to_s).include?(params[:locale])
			I18n.locale = params[:locale]
		end
	 end
end


def configure_sanitized_parameters
	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	  user_params.permit(:name, :email, :password, :password_confirmation, :image)
	end

	devise_parameter_sanitizer.permit(:sign_in) do |user_params|
	  user_params.permit(:name, :email, :password, :password_confirmation, :image)
	end

	devise_parameter_sanitizer.permit(:account_update) do |user_params|
		user_params.permit(:name, :email, :password, :password_confirmation, :current_password, :image)
	end
end

end
