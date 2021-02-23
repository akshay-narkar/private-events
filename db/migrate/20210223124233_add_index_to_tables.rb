class AddIndexToTables < ActiveRecord::Migration[6.1]
  def change
    add_index(:attendances, [:attendee_id, :attended_event_id])
    add_index(:events, :creator_id)
  end
end
