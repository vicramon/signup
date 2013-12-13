class HomeController < ApplicationController
  expose(:user) { User.new }
end
