class RemoveAccounts < ActiveRecord::Migration
  def change
    drop_table :accounts
  end
end
