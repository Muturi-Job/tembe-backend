class UserMedication < ApplicationRecord
    belongs_to :user
    belongs_to :medication
    has_many :doses, dependent: :destroy
  
    after_create :generate_doses
  
    private
  
    def generate_doses
      frequency_multiplier = frequency_to_multiplier(medication.frequency)
      num_doses = duration * frequency_multiplier
      time_interval_hours = 24 / frequency_multiplier
  
      current_time = calculate_start_time
  
      num_doses.times do
        create_dose(current_time)
        current_time += time_interval_hours.hours
        current_time = adjust_time(current_time)
      end
    end
  
    def frequency_to_multiplier(frequency)
      case frequency
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
    end
  
    def calculate_start_time
      start_time = start_date.to_datetime.beginning_of_day + 8.hours
    end
  
    def create_dose(time)
      doses.create!(
        scheduled_time: time,
        missed: false
      )
    end
  
    def adjust_time(time)
      if time.hour >= 24
        time = time.tomorrow.beginning_of_day + (time.hour - 24).hours + time.min.minutes
      end
      time
    end
  end
  