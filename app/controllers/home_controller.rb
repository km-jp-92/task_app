class HomeController < ApplicationController
  def index
    @user = User.new
    @devise_mapping = Devise.mappings[:user]
  end
end
