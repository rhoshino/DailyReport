class AddSendAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :send_address, :text
  end
end
