class AddRequireSlotToForms < ActiveRecord::Migration
  def change
    add_column :forms, :require_slot, :boolean, default: false
  end
end
