# frozen_string_literal: true

class Api::V1::Sessions::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :user_params, only: [:create]
  # POST /api/v1/users
  def create
    # Build the resource with the permitted parameters
    build_resource(user_params)
    if resource.save
      render json: { message: 'User created successfully.' }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    # Unnest the parameters if necessary
    if params[:registration].present?
      params[:user] = params.dig(:registration, :user)
    end

    # Manually permit the required parameters
    params.require(:user).permit(:email, :password, :password_confirmation)
    # byebug
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
end
