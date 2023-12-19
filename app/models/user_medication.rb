class UserMedication < ApplicationRecord
    belongs_to :user
    belongs_to :medication
    has_many :doses
end
