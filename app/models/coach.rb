class Coach < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  has_one_attached :image
  after_save :add_image_path

  validates_presence_of :name, :location, :qualification, :charge_per_hour, :phone_number

  def add_image_path
    path = Rails.application.routes.url_helpers.rails_blob_path(self.image, only_path: true)
    update_columns(image_path: path)
  end

  def self.coach_name(coach_id)
    find_by(id: coach_id).name
  end
end
