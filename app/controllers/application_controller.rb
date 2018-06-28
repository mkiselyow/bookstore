class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :set_locale
  before_action :current_or_guest_customer

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

  # if user is logged in, return current_customer, else return guest_customer
  def current_or_guest_customer
    if current_customer
      if session[:guest_customer] && session[:guest_customer] != current_customer
        logging_in
        # reload guest_customer to prevent caching problems before destruction
        guest_customer(with_retry = false).try(:reload).try(:destroy)
        session[:guest_customer] = nil
      end
      current_customer
    else
      guest_customer
    end
  end

  # find guest_customer object associated with the current session,
  # creating one as needed
  def guest_customer(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_customer ||= session[:guest_customer] ||= create_guest_customer

  rescue ActiveRecord::RecordNotFound # if session[:guest_customer_id] invalid
    session[:guest_customer] = nil
    guest_customer if with_retry
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    guest_orders = guest_customer.orders
    guest_orders.each do |line_item|
      order.customer_id = current_customer.id
      order.save!
    end
  end

  def create_guest_customer
    customer = Customer.new(:email => "guest_customer_#{Time.now.to_i}#{rand(100)}@example.com")
    session[:guest_customer] = customer
    customer
  end
end
