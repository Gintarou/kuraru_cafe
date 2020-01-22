class MenuController < ApplicationController
  before_action :logged_in_user, only: [:new]

  def index
    @morning_menus = MorningMenu.all
    @lunch_menus = LunchMenu.all
  end

  def new
  end
end
