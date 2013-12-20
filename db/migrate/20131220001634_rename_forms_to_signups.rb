class RenameFormsToSignups < ActiveRecord::Migration
  def change
    rename_table :forms, :signups
    remove_column :signups, :account_id
  end
end
