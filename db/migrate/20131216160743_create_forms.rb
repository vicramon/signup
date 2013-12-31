class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.references :account, index: true
      t.string :name
      t.text :description
      t.date :date
      t.time :starts_at
      t.time :ends_at
      t.boolean :send_reminders, default: true
      t.integer :reminder_days_before, default: 1
      t.boolean :notify_admin_of_new_signup, default: true
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
