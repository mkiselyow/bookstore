class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :set_locale

  def extract_locale
    parsed_locale = request.host.split('.').first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
 
  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def current_ability
    @current_ability ||= Ability.new(current_customer)
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
