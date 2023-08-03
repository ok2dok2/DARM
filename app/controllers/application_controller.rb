class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def change_locale
    locale = params[:locale].to_sym
    locale = I18n.default_locale unless I18n.available_locales.include?(locale)
    session[:locale] = locale
    redirect_back(fallback_location: root_path)
  end

  protected

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :introduce, :image, :admin, :tag_list])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :name, :introduce, :tag_list])
  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
  
end
