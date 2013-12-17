class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :kind
      t.boolean :required, default: false
      t.references :form, index: true

      t.timestamps
    end
  end
end
