class LoginsController < ApplicationController
  def create
    @user = User.find_by!(email: params["email"])
    if @user.authenticate(params["password"])
      #login[user_id] = @user.id ??
      render json: { user: @user.as_json(only: [:email]) } #:access_token
             status: :ok
    else
      render json: { message: "Email or password could not be found." }
             status: :unauthorized
    end
  end
end
