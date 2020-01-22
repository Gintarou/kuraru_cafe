module UsersHelper

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  # adminユーザーではない場合rootにリダイレクトさせる
  # def admin_only_access
  #   if session[:user_id]
  #     @current_user ||= User.find_by(id: session[:user_id])
  #     if !@user.admin?
  #       redirect_to root_path
  #     end
  #   else
  #     redirect_to root_path
  #   end
  # end

end
