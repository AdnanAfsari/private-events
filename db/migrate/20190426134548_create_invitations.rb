class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :event, foreign_key: true
      t.integer    :sender_id, index: true
      t.integer    :receiver_id, index: true
      t.boolean    :accepted, default: false

      t.timestamps
    end
    add_index :invitations, [:event_id, :sender_id, :receiver_id], unique: true
  end
end
