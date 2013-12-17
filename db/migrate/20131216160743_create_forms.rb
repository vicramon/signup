class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.references :account, index: true
      t.string :name
      t.text :description
      t.date :date
      t.time :starts
      t.time :ends
      t.boolean :send_reminders
      t.integer :reminder_days_before
      t.boolean :notify_admin_of_new_signup

      t.timestamps
    end
  end
end
