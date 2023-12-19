class UserMedication < ApplicationRecord
    belongs_to :user
    belongs_to :medication
    has_many :doses, dependent: :destroy

    after_create :generate_doses

    private
    def generate_doses
        frequency_multiplier = case medication.frequency
          when "twice" then 2
          when "thrice" then 3
          when "four times" then 4
          when "five times" then 5
          when "six times" then 6
          when "seven times" then 7
          when "eight times" then 8
          when "nine times" then 9
          when "ten times" then 10
          else 1
        end
    
        num_doses = duration * frequency_multiplier
        time_interval_hours = 24 / frequency_multiplier
    
        current_datetime = self.start_date.to_datetime.beginning_of_day + 8.hours
    
        num_doses.times do
          doses.create!(
            scheduled_time: current_datetime,
            missed: false
          )
    
          current_datetime += time_interval_hours.hours
    
          if current_datetime.hour >= 24
            current_datetime = current_datetime.tomorrow.beginning_of_day + (current_datetime.hour - 24).hours + current_datetime.min.minutes
          end
        end
      end
    end