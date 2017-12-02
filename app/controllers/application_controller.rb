class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :require_login
  
    def current_user
      current_user ||= Crew.find_by(id: session[:crew_id])
    end
  
    def logged_in?
      !!current_user
    end

    def require_login
      redirect_to '/' unless session.include? :crew_id
  end
end
