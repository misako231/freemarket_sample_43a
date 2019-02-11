class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  private
  def callback_for(provider)
    provider = provider.to_s
    @user = User.find_oauth(request.env["omniauth.auth"])
      omniauth_info = request.env["omniauth.auth"]
      omniauth_name = omniauth_info[:info][:name]
      omniauth_email = omniauth_info[:info][:email]
      redirect_to new_user_registration_path(name: omniauth_name, email: omniauth_email)
  end

  def failure
    redirect_to root_path and return
  end
end
