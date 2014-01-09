class AddRsvpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rsvp, :boolean, default: false
  end
end
