class HomeController < ApplicationController
  def index

    if user_signed_in?
      redirect_to tasks_path # ログイン済みならタスク一覧に飛ばす
    end
  end
end
