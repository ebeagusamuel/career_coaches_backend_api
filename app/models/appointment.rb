class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :coach

  validates :date_and_time, presence: true
end


