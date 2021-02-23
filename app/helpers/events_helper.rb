module EventsHelper
  def attendbutton(_xyz)
    if session[:user_id].nil?
      render 'attend'
    else
      render 'notattend' # need to pass xyz so that it recognizes what to print
    end
  end

  def redirecttosession
    if session[:user_id].nil?
      controller.redirect_to new_session_path

    else
      render 'redirectpage'
    end
  end
end
