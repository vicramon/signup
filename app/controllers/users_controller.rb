class UsersController < ApplicationController
  expose(:user, attributes: :user_params)

  def create
    if user.save
      sign_in(user)
      redirect_to [:dashboard, :index]
    else
      flash[:signup] = 'Sorry, but there
        were errors in your signup information.'
      redirect_to :root
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password).
      merge(password_confirmation: params[:user][:password])
  end

end
