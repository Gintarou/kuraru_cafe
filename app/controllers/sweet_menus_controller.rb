class SweetMenusController < ApplicationController
  before_action :admin_only_access, only: [:new, :edit]

  def index
    redirect_to menus_path
  end

  def new
    @sweet_menu = SweetMenu.new
  end

  def create
    @sweet_menu = SweetMenu.new(sweet_menu_params)
    if @sweet_menu.save
      redirect_to @sweet_menu
    else
      render 'new'
    end
  end

  def show
    @sweet_menu = SweetMenu.find(params[:id])
  end

  def edit
    @sweet_menu = SweetMenu.find(params[:id])
  end

  def update
    @sweet_menu = SweetMenu.find(params[:id])
    if @sweet_menu.update_attributes(sweet_menu_params)
      redirect_to @sweet_menu
    else
      render 'edit'
    end
  end

  def delete

  end

  private

    def sweet_menu_params
      params.require(:sweet_menu).permit(:sweet_image, :name, :price, :commitment, :allergy)
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
