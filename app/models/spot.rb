class Spot < ApplicationRecord
  mount_uploader :image, ImageUploader
  enum license: {undefined: 0, cc_by: 1, cc_by_nc: 2}

  class << self
    def localed_licenses
      licenses.keys.map do |s|
        [ApplicationController.helpers.t("spots.license.#{s}"), s]
      end
    end
  end

  def license_image
    if self.cc_by? then
      'https://i.creativecommons.org/l/by/4.0/88x31.png'
    elsif self.cc_by_nc? then
      'https://i.creativecommons.org/l/by-nc/4.0/88x31.png'
    else
      ''
    end
  end

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
