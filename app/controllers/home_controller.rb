class HomeController < ApplicationController
  before_filter :redirect_if_signed_in

  private

  def redirect_if_signed_in
    redirect_to :dashboard if signed_in?
  end
end
