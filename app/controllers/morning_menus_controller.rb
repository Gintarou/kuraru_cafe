class MorningMenusController < ApplicationController

  def new
    @morning_menu = MorningMenu.new
  end

  def create
    @morning_menu = MorningMenu.create morning_menu_params
    redirect_to @morning_menu
  end

  def show
    @morning_menu = MorningMenu.find(params[:id])
  end

  def edit
    @morning_menu = MorningMenu.find(params[:id])
  end

  def update
    @morning_menu = MorningMenu.find(params[:id])
    @morning_menu.update morning_menu_params
    redirect_to @morning_menu
  end

  private

    def morning_menu_params
      params.require(:morning_menu).permit(:morning_image, :name, :price, :commitment, :allergy)
    end

end
