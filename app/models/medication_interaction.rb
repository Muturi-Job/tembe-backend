class MedicationInteraction < ApplicationRecord
    belongs_to :medication1, class_name: 'Medication', foreign_key: 'medication1_id'
    belongs_to :medication2, class_name: 'Medication', foreign_key: 'medication2_id'
end
