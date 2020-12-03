class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :coach

  validates :date_and_time, presence: true

  def self.already_exist?(user_id, coach_id)
    count = where(user_id: user_id, coach_id: coach_id).count
    count.positive?
  end
end
