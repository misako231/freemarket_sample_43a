class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    unless @user.class == Array
      # redirect_to root_path
      sign_in_and_redirect @user, event: :authentication #after_sign_in_path_forと同じパス
      # set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      # session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      omniauth_info = request.env["omniauth.auth"]
      # omniauth_info = @user
      omniauth_name = omniauth_info[:info][:name]
      omniauth_email = omniauth_info[:info][:email]
      omniauth_password = @user[2][:password]
      omniauth_uid = omniauth_info[:uid]
      omniauth_provider = omniauth_info[:provider]
      omniauth_token = omniauth_info[:credentials][:token]

      redirect_to new_user_registration_path(name: omniauth_name, email: omniauth_email,password: omniauth_password,uid: omniauth_uid, provider: omniauth_provider, token: omniauth_token)
    end
  end

  def failure
    redirect_to root_path and return
  end

end
