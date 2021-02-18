class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.timestamps
    end
  add_column :attendances, :attendee_id, :integer
  add_column :attendances, :attended_event_id, :integer
  end
end
