class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # deviceのコントローラーのときに、下記のメソッドを呼ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # sign_inのときに、usernameも許可する
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    # sign_upのときに、usernameも許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    #  account_updateのときに、usernameも許可する
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(resource)
    '/tweets/new'
  end
end
