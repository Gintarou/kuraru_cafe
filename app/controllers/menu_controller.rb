class MenuController < ApplicationController
  def index
    @morning_menus = MorningMenu.all
    @lunch_menus = LunchMenu.all
  end

  def new
  end
end
