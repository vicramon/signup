class SessionsController < ApplicationController
  expose(:user) { User.find_by_email(params[:email]) }

  def new
    redirect_to :dashboard if current_user
  end

  def create
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to [:dashboard, :index]
    else
      flash.alert = "Your email and password do not match."
      render :new
    end
  end

  def destroy
    session[:current_form_id] = nil
    sign_out
    redirect_to :root
  end

end
