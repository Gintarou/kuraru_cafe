class MorningMenusController < ApplicationController
  before_action :admin_only_access, only: [:new, :edit]

  def index
    redirect_to menus_path
  end

  def new
    @morning_menu = MorningMenu.new
  end

  def create
    @morning_menu = MorningMenu.new(morning_menu_params)
    if @morning_menu.save
      redirect_to @morning_menu
    else
      render 'new'
    end
  end

  def show
    @morning_menu = MorningMenu.find(params[:id])
  end

  def edit
    @morning_menu = MorningMenu.find(params[:id])
  end

  def update
    @morning_menu = MorningMenu.find(params[:id])
    if @morning_menu.update_attributes(morning_menu_params)
      redirect_to @morning_menu
    else
      render 'edit'
    end
  end

  def delete

  end

  private

    def morning_menu_params
      params.require(:morning_menu).permit(:morning_image, :name, :price, :commitment, :allergy)
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
