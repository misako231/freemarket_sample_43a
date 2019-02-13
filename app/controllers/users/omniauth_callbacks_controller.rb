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
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_path(
        name: @user[0][:nickname],
        email: @user[1][:email],
        password: @user[2][:password],
        uid: @user[3][:uid],
        provider: @user[4][:provider],
        )
    end
  end

  def failure
    redirect_to root_path and return
  end

end
