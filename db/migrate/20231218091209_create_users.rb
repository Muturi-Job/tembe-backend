class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :plan
      t.string :gender
      t.date :date_of_birth
      t.integer :height
      t.integer :weight
      t.integer :age

      t.timestamps
    end
  end
end
