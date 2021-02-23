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

  def allevents(variable)
    if session[:user_id].nil?
      render 'usernil'
    elsif session[:user_id] != variable.creator_id
      render partial: 'usernocreator', locals: { variable1: variable }

    else
      render 'useriscreator'
    end
  end
end
