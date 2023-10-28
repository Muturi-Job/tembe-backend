class CreateMedicationInteractions < ActiveRecord::Migration[7.1]
  def change
    create_table :medication_interactions do |t|
      t.references :medication1, foreign_key: { to_table: :medications }
      t.references :medication2, foreign_key: { to_table: :medications }
      t.text :description

      t.timestamps
    end
  end
end
