class LunchMenusController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit]

  def new
    @lunch_menu = LunchMenu.new
  end

  def create
    @lunch_menu = LunchMenu.new(lunch_menu_params)
    if @lunch_menu.save
      redirect_to @lunch_menu
    else
      render 'new'
    end
  end

  def show
    @lunch_menu = LunchMenu.find(params[:id])
  end

  def edit
    @lunch_menu = LunchMenu.find(params[:id])
  end

  def update
    @lunch_menu = LunchMenu.find(params[:id])
    if @lunch_menu.update_attributes(lunch_menu_params)
      redirect_to @lunch_menu
    else
      render 'edit'
    end
  end

  def delete
  end

  private

    def lunch_menu_params
      params.require(:lunch_menu).permit(:lunch_image, :name, :price, :commitment, :allergy)
    end

end
