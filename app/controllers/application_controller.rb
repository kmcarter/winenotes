class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  
  private
    def current_user
      warden.user
    end
    helper_method :current_user
    
    def authorize
      redirect_to sign_in_url, alert: "You must be signed in to use this application." if current_user.nil?
    end
    
    def warden
      env['warden']
    end
end
