module EventsHelper
  def attendbutton(_xyz)
    if session[:user_id].nil?
      render 'attend'
    else
      render 'notattend'
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
