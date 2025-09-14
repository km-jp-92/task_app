class HomeController < ApplicationController
  def index
    @user = User.new
    @devise_mapping = Devise.mappings[:user]

    if user_signed_in?
      redirect_to tasks_path # ログイン済みならタスク一覧に飛ばす
    end
  end
end
