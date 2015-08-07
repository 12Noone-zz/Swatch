class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  helper_method :require_current_user
  helper_method :current_user

  def require_current_user
    unless current_user
      flash[:message] = "You must be signed in to do that!"
      redirect_to '/'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

end
