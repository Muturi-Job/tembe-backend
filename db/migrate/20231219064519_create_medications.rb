class CreateMedications < ActiveRecord::Migration[7.1]
  def change
    create_table :medications do |t|
      t.string :name 
      t.string :form 
      t.string :frequency 
      t.integer :dosage_quantity
      t.string :dosage_units
      t.text :instructions
      t.text :description

      t.timestamps
    end
  end
end
