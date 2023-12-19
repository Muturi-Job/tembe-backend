class Medication < ApplicationRecord
    has_many :reports, as: :reportable
    has_many :user_medications
    has_many :users, through: :user_medications
    has_many :doses

    validates :frequency, inclusion: { in: ['once', 'twice', 'thrice', 'four times', 'five times', 'six times', 'seven times', 'eight times', 'nine times', 'ten times'] }

end
