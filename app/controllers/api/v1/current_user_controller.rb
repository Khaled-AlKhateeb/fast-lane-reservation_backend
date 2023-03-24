class Api::V1::CurrentUserController < ApplicationController
  def index
    render json: :current_user, status: :ok
  end
end
