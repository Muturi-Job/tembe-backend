class User < ApplicationRecord
    has_secure_password
    has_many :user_medications
    has_many :medications, through: :user_medications
    has_many :doses
    has_many :reports

    validates :email, uniqueness: true
end
