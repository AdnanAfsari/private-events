# frozen_string_literal: true

class AddCreatorToEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :user, foreign_key: true
  end
end
