class SessionsController < ApplicationController
  def googleAuth

    access_token = request.env["omniauth.auth"] #token from goog server

    # log_in(user)

    user = User.from_omniauth(access_token)
    user.google_token = access_token.credentials.token

   # Refresh_token only sent once during first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save #creates user but still need sign in functionality
    @user = user
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.name}!"
    sign_in(user)
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path

  end

end
