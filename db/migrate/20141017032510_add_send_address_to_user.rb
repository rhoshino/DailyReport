class AddSendAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :send_adress, :text
  end
end
