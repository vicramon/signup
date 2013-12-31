class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.boolean :temporary, default: false

      t.timestamps
    end
  end
end
