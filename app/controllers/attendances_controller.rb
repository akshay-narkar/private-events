class AttendancesController < ApplicationController
  def new; end

  def create
    @mark = Attendance.new(params_new)

    if @mark.save
      redirect_to event_path(@mark.attended_event_id)
    else
      redirect_to root_path, alert: 'Event Full'
    end
  end

  def index; end

  def show; end

  private

  def params_new
    params.permit(:attendee_id, :attended_event_id)
  end
end
