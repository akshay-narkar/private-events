module ApplicationHelper
  def notice
    render 'layouts/notice' if flash[:notice]
    # render plain: flash[:notice] if flash[:notice]
  end

  def loggedin
    if session[:user_id].nil?
      render 'layouts/loggedin'

    else
      render 'layouts/loggedout'
      # <p><%= link_to 'Sign Up', new_user_path %> | <%= link_to 'login', new_session_path%> |
      # <%=link_to 'Create Event', new_session_path%> </p>
    end
  end
end
