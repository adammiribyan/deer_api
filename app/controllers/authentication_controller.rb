class AuthenticationController < ApplicationController
  skip_before_action :authenticate_token!

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      render json: { token: JsonWebToken.encode(sub: { id: user.id, email: user.email }) }
    else
      render json: { errors: ['Invalid email or password'] }, status: :unauthorized
    end
  end
end
