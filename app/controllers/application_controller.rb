class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  helper_method :current_user
  #
  # def authenticate
  # 	redirect_to :login unless user_signed_in?
  # end

  def current_user
    return false if session[:user_id].nil?
    User.find(session[:user_id])
  end
  #
  # def user_signed_in?
  # 	# converts current_user to a boolean by negating the negation
  # 	!!current_user
  # end
end
