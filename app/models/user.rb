class User < ApplicationRecord
    has_secure_password
    has_many :user_medications
    has_many :medications, through: :user_medications
    has_many :doses
    has_many :reports

    validates :email, uniqueness: true
    validates :password, length:  {minimum: 6}, if: :password_required?


  private

  def password_required?
    new_record? || password.present?
  end
end
