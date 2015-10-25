class SessionsController < ApplicationController

  def new; end

  def create
    if login(params[:email], params[:password])
      redirect_to my_dashboard_path, notice: 'Sign in successfully.'
    else
      flash[:notice] = 'Fail to signin'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Sign out successfully.'
  end

end
