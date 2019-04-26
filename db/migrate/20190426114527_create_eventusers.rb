class CreateEventusers < ActiveRecord::Migration[5.2]
  def change
    create_table :eventusers do |t|
      t.references :attendee
      t.references :attended_event

      t.timestamps
    end
    add_index :eventusers, [:attendee_id, :attended_event_id], unique: true
  end
end
