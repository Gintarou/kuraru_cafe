class DrinkMenusController < ApplicationController
  before_action :admin_only_access, only: [:new, :edit]

  def new
    @drink_menu = DrinkMenu.new
  end

  def create
    @drink_menu = DrinkMenu.new(drink_menu_params)
    if @drink_menu.save
      redirect_to @drink_menu
    else
      render 'new'
    end
  end

  def show
    redirect_to menus_path
  end

  def edit
    @drink_menu = DrinkMenu.find(params[:id])
  end

  def update
    @drink_menu = DrinkMenu.find(params[:id])
    if @drink_menu.update_attributes(drink_menu_params)
      redirect_to @drink_menu
    else
      render 'edit'
    end
  end

  def delete
  end

  private

    def drink_menu_params
      params.require(:drink_menu).permit(:drink_image, :name, :price, :commitment, :allergy)
    end

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
