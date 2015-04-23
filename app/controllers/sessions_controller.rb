class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to products_path, notice: "You are now logged in."
    else
      flash.now[:alert] = "Invalid email or password.  Please try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_path, notice: "You are now logged out."
  end
end
