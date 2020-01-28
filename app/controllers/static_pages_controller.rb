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

  def downloadpdf
    file_name = "kiyaku.pdf"
    filepath = Rails.root.join('public',file_name)
    stat = File::stat(filepath)
    send_file(filepath, :filename => file_name, :length => stat.size)
  end

end
