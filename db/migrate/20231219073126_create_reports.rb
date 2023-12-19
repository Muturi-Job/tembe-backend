class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :reportable_type
      t.integer :reportable_id
      t.string :report_type
      t.text :details

      t.timestamps
    end
  end
end
