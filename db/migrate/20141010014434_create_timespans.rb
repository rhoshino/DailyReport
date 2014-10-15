class CreateTimespans < ActiveRecord::Migration
  def change
    create_table :timespans do |t|
      t.integer :report_id
      t.time :start_time
      t.time :end_time
      t.time :rest_time
      t.string :type
      t.timestamps
    end
  end
end
