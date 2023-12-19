class Dose < ApplicationRecord
    # belongs_to :user
    # belongs_to :medication
    belongs_to :user_medication
    has_many :reports, as: :reportable

    
end
