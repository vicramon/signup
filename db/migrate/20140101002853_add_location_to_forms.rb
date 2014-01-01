class AddLocationToForms < ActiveRecord::Migration
  def change
    add_column :forms, :location, :text
  end
end
