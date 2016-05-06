class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  
  private
    def current_user
      if warden.user
        warden.user
      end
    end
    helper_method :current_user
    
    def user_links
      if warden.user
        [OpenStruct.new(name: 'Sign Out', target: sign_out_path)]
      else
        [OpenStruct.new(name: 'Sign In', target: sign_in_path),
        OpenStruct.new(name: 'Sign Up', target: new_user_path)]
      end
    end
    helper_method :user_links
    
    def authorize
      redirect_to sign_in_url, alert: "You must be signed in to use this application." if current_user.nil?
    end
    
    def warden
      env['warden']
    end
end
