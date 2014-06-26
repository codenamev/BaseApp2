class ApplicationController < ActionController::Base
  
  before_filter :prepare_for_mobile
  before_filter :set_user_language

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper :all # include all helpers, all the time

  # Return the value for a given setting
  def s(identifier)
    Setting.get(identifier)
  end
  helper_method :s
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  alias :logged_in? :user_signed_in?
  helper_method :logged_in?

  layout Proc.new { |controller| 
    if devise_controller?
      "login"
    else
      controller.request.xhr? ? 'simple' : 'application' 
    end
  }
  
  def layout_by_resource
    if devise_controller? 
      "login"
    else
      "application"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :name, :identity_url, :language, :email, :password, :password_confirmation) }
  end  
  
    
  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?
  
  def set_user_language
    I18n.locale = current_user.language if logged_in?
  end

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

end
