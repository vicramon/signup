class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :name
      t.integer :max
      t.references :form, index: true
    end
  end
end
