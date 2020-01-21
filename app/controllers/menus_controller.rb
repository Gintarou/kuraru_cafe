class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create menu_params
    redirect_to @menu
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update menu_params
  end

  private

    def menu_params
      params.require(:menu).permit(:image, :name, :price, :commitment, :allergy)
    end
end
