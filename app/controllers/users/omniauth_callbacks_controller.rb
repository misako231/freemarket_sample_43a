# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

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
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #after_sign_in_path_forと同じパス
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      # session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      # @facebook_info_params = []
      if provider == "facebook"
        facebook_info = request.env["omniauth.auth"]
        facebook_name = facebook_info[:info][:name]
        facebook_email = facebook_info[:info][:email]
        redirect_to new_user_registration_path(name: facebook_name, email: facebook_email)
      elsif provider == "Google"
        # Google_info = request.env["omniauth.auth"]
        # Google_name = Google_info[:info][:name]
        # Google_email = Google_info[:info][:email]
        # redirect_to new_user_registration_path(name: Google_name, email: Google_email)
      end
    end
  end

  def failure
    redirect_to root_path and return
  end
end
