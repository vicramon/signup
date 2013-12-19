class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.references :group, index: true

      t.timestamps
    end
  end
end