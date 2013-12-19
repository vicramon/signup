class SignupsController < ApplicationController
  before_filter :create_temporary_if_no_user


  private

  def create_temporary_if_no_user
    sign_in(User.create_temporary)
  end
end
