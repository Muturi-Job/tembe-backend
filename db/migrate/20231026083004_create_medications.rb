class CreateMedications < ActiveRecord::Migration[7.1]
  def change
    create_table :medications do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :dosage
      t.string :frequency
      t.date :start_date
      t.date :end_date
      t.text :notes

      t.timestamps
    end
  end
end
