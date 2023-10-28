class User < ApplicationRecord
    has_many :medications
    has_many :health_metrics
    has_many :medication_interactions
end
