class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # redirect to tickets menaging page
    else
      flash.now[:danger] = 'Email or password error'
      render 'new'
  end
end
