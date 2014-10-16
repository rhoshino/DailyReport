class AddPubblishToReport < ActiveRecord::Migration
  def change
    add_column :reports, :public_flag, :boolean, :default => false
  end
end
