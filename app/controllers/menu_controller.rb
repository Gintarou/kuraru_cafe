class MenuController < ApplicationController
  before_action :admin_only_access, only: [:new]

  def index
    @morning_menus = MorningMenu.all
    @lunch_menus = LunchMenu.all
    @sweet_menus = SweetMenu.all
    @drink_menus = DrinkMenu.all
  end

  def new
  end

  private

    # adminユーザーではない場合loginページにリダイレクトさせる
    def admin_only_access
      if session[:user_id]
        @user ||= User.find_by(id: session[:user_id])
        if !@user.admin? &&  logged_in?
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end
end
