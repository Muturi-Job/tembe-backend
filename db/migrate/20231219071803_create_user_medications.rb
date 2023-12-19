class CreateUserMedications < ActiveRecord::Migration[7.1]
  def change
    create_table :user_medications do |t|
      t.integer :user_id
      t.integer :medication_id
      t.date :start_date
      t.date :completion_date
      t.text :notes

      t.timestamps
    end
  end
end
