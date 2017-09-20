class Api::V1::UserController < ApplicationController
  def create
    user = User.create(user_params)

    if user.valid?
      render json: user, status: 200
    else
      render json: { error: "Username already exists." }, status: 400
    end
  end

  def login
    user = User.find_by(username: params[:user][:username])

    if(user && user.authenticate(params[:user][:password]))
      render json: user, status: 200
    else
      render json: { error: "Invalid credentials." }, status: 400
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :username,
        :password,
        :password_confirmation,
        :first_name,
        :last_name
      )
    end
end
