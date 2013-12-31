class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.references :form, index: true
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end
