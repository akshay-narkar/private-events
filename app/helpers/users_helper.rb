module UsersHelper
  def upcoming_events(variable)
    return unless (Event.find_by_id(variable.attended_event_id).eventdate - Date.today).positive?

    render partial: 'upcoming_events', locals: { variable1: variable }
  end

  def past_events(variable)
    return unless (Event.find_by_id(variable.attended_event_id).eventdate - Date.today) <= 0

    render partial: 'past_events', locals: { variable1: variable }
  end
end
