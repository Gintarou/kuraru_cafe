class LunchMenusController < ApplicationController
  before_action :admin_only_access, only: [:new, :edit]

  def new
    @lunch_menu = LunchMenu.new
  end

  def create
    @lunch_menu = LunchMenu.new(lunch_menu_params)
    if @lunch_menu.save
      redirect_to menus_path
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
      redirect_to menus_path
    else
      render 'edit'
    end
  end

  def destroy
    @lunch_menu = LunchMenu.find(params[:id])
    @lunch_menu.delete
    redirect_to menus_path
  end

  private

    def lunch_menu_params
      params.require(:lunch_menu).permit(:lunch_image, :name, :price, :commitment, :allergy)
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
