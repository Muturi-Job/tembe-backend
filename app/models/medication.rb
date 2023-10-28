class Medication < ApplicationRecord
    belongs_to :user
  has_and_belongs_to_many :medication_interactions, join_table: 'medication_interactions',
                                                    foreign_key: 'medication1_id',
                                                    association_foreign_key: 'medication2_id'
end
