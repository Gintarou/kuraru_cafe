class StaticPagesController < ApplicationController
  def home
    if session[:user_id]
      @user ||= User.find_by(id: session[:user_id])
    end
  end

  def about
  end

  def rental
  end

  def contact
  end
end
