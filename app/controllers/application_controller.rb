class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :user_signed_in?, :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def user_signed_in?
    logged_in?
  end

  def require_user
    unless logged_in?
      flash[:alert] = "Vous devez être connecté pour effectuer cette action"
      redirect_to login_path
    end
  end

  def admin?
    logged_in? && current_user.is_admin?
  end

  def require_admin
    unless admin?
      flash[:alert] = "Accès réservé aux administrateurs"
      redirect_to root_path
    end
  end
end
