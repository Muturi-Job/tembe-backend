class Medication < ApplicationRecord
    has_many :reports, as: :reportable
    has_many :user_medications
    has_many :users, through: :user_medications
    has_many :doses
end
