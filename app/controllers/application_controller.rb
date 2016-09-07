class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :set_paper_trail_whodunnit
  use OmniAuth::Strategies::Developer

  before_action :configure_permitted_parameters, if: :devise_controller?

  
  #for role column on devise user
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sing_up, keys: [:preferred_language])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:preferred_language])
  end
end
