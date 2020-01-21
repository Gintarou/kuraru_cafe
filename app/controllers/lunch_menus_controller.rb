class LunchMenusController < ApplicationController

  def new
    @lunch_menu = LunchMenu.new
  end

  def create
    @lunch_menu = LunchMenu.create lunch_menu_params
    redirect_to @lunch_menu
  end

  def show
    @lunch_menu = LunchMenu.find(params[:id])
  end

  def edit
    @lunch_menu = LunchMenu.find(params[:id])
  end

  def update
    @lunch_menu = LunchMenu.find(params[:id])
    @lunch_menu.update lunch_menu_params
    redirect_to @lunch_menu
  end

  private

    def lunch_menu_params
      params.require(:lunch_menu).permit(:lunch_image, :name, :price, :commitment, :allergy)
    end

end
