class CreateHealthMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :health_metrics do |t|
      t.belongs_to :user, index: true
      t.string :metric_type
      t.decimal :value, precision: 8, scale: 2
      t.datetime :measurement_datetime
      t.text :notes

      t.timestamps
    end
  end
end
