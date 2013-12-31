class AddInviteTextToForms < ActiveRecord::Migration
  def change
    add_column :forms, :invite_text, :text
  end
end
