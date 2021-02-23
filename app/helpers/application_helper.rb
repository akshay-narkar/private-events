module ApplicationHelper
  def notice
    render 'layouts/notice' if flash[:notice]
  end

  def loggedin
    if session[:user_id].nil?
      render 'layouts/loggedin'

    else
      render 'layouts/loggedout'
    end
  end
end
