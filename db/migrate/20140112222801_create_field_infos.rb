class CreateFieldInfos < ActiveRecord::Migration
  def change
    create_table :field_infos do |t|
      t.references :field, index: true
      t.references :rsvp, index: true
      t.text :info

      t.timestamps
    end
  end
end
