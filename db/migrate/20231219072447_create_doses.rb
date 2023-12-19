class CreateDoses < ActiveRecord::Migration[7.1]
  def change
    create_table :doses do |t|
      t.integer :user_medication_id
      t.datetime :scheduled_time
      t.datetime :taken_time
      t.boolean :missed

      t.timestamps
    end
  end
end
