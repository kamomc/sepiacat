class Spot < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name,
            presence: true
  validates :image,
            presence: true
  validates :latitude,
            presence: true
  validates :longitude,
            presence: true
  validates :year,
            presence: true,
            numericality: {
                less_than: 2100,
                greater_than: 1000
            }
end
