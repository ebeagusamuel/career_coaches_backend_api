class Coach < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  has_one_attached :image
  after_save :add_image_path

  validates_presence_of :name, :location, :qualification, :charge_per_hour, :phone_number

  def add_image_path
    image = self.image 
    path = rails_blob_path(image)
    self.update_attributes(image_path: image_path)
  end
end
