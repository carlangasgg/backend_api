# frozen_string_literal: true

class Api::V1::Sessions::SessionsController < DeviseTokenAuth::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # def create
  #   super
  # end

  private

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
