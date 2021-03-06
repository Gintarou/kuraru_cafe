module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # ユーザーがadminとしてログインしていればtrue、その他ならfalseを返す
  def logged_in_as?(user)
    !current_user.nil? && current_user.admin?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end



  # 現在のユーザがadmin出ない場合rootにリダイレクトさせる
  # def admin_only_access
  #   if current_user.admin? && current_user
  #     redirect_to root_path
  #   end
  # end
end
