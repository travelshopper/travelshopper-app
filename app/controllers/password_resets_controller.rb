class PasswordResetsController < ApplicationController
  skip_before_action :require_login
  before_action :prepare_user_from_email, only: :create
  before_action :prepare_user_from_token, only: [:edit, :update]

  def create
    @user.deliver_reset_password_instructions! if @user

    redirect_to root_path, notice: 'Instruction has been sent to your email'
  end

  def edit
    not_authenticated && return if @user.blank?
  end

  def update
    not_authenticated && return if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.change_password!(params[:user][:password])
      redirect_to root_path, notice: 'Password was successfully reset'
    else
      render :edit
    end
  end

  private

  def prepare_user_from_email
    @user = User.find_by_email(params[:email])
  end

  def prepare_user_from_token
    @user = User.load_from_reset_password_token(params[:id])
  end
end
