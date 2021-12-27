class SessionController < ApplicationController
  skip_before_action :require_login

  def login; end

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      p 'Login'
      sign_in user
      redirect_to root_path
    else
      p 'Redirected'
      # flash.now[:danger] = 'Неверный логин или пароль'
      redirect_to session_login_path
    end
  end

  def logout
    sign_out
    redirect_to session_login_path
  end
end
