class RenameStartsAndEndsInSignups < ActiveRecord::Migration
  def change
    rename_column :signups, :starts, :starts_at
    rename_column :signups, :ends, :ends_at
  end
end
