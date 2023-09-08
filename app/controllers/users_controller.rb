# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { message:"User Added!!", data: @user }
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: { message:"User updated!!", data: @user }
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { message:"User Delete!!", data: @user }
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
