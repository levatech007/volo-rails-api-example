class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # Devise permitted parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :avatar_cache, :remove_avatar ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :avatar_cache, :remove_avatar])
    devise_parameter_sanitizer.permit(:omniauth, keys: [:name, :image, :email ])
    end
end
