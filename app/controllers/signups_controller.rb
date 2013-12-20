class SignupsController < ApplicationController
  before_filter :create_temporary_if_no_user
  expose(:signup)

  def new
    render :basic_info
  end

  private

  def create_temporary_if_no_user
    sign_in(User.create_temporary)
  end

  def current_signup
    sessions[:current_signup]
  end

end
