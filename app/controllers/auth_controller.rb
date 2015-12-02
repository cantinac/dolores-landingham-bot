class AuthController < ApplicationController
  skip_before_action :authenticate_user!

  def oauth_callback
    auth = request.env["omniauth.auth"]
    auth_email = auth.extra.raw_info.email

    if is_cantina?(auth_email)
      session[:token] = auth.credentials.token
      flash[:success] = "You successfully signed in"
      redirect_to root_path
    else
      unauthorized
    end
  end

  private

  def is_cantina?(auth_email)
    /cantinaconsulting.com/.match(auth_email)
  end
end
