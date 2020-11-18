class Coach < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  has_one_attached :image

  validates_presence_of :name, :location, :qualification, :charge_per_hour
end
