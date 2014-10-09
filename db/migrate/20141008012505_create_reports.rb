class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :reportTitle
      t.text :reportBodyText
      t.date :reportDate

      t.integer :reportAuthorID

      t.timestamps
    end
     add_index :reports, :reportAuthorID
  end
end
