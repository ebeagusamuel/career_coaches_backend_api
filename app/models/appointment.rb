class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :coach

  validates :date_and_time, presence: true

  def self.for_user(user_id, coach_id)
    where(user_id: user_id, coach_id: coach_id)
  end
end
