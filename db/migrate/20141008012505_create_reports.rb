class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report_title
      t.text :report_body_text
      t.date :report_date

      t.timestamps
    end
  end
end
