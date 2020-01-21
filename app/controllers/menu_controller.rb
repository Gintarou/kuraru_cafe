class MenuController < ApplicationController
  def index
    @morning_menus = MorningMenu.all
    @lunch_menus = LunchMenu.all
  end

  def new
    if !logged_in?
      redirect_to login_path
    end
  end
end
