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

  def marker
    {
        :latlng => [self.latitude, self.longitude],
        :popup => ActionController::Base.helpers.content_tag(:h2, self.name) +
            ActionController::Base.helpers.content_tag(:dl,ActionController::Base.helpers.content_tag(:dt, ActionController::Base.helpers.image_tag(self.image.url) ) )+
            ActionController::Base.helpers.content_tag(:p, self.comment) +
            ActionController::Base.helpers.link_to("詳細を見る", Rails.application.routes.url_helpers.spot_path(self)),
        :icon => {
            :icon_url => pin_image,
            :popup_anchor => [2, -41],
            :shadow_anchor => [10, 41],
            :icon_anchor => [22, 51]
        }
    }
  end

  def pin_image
    if self.year <= 1940 then
      'images/marker5-8.png'
    elsif self.year <= 1960 then
      'images/marker4-8.png'
    elsif self.year <= 1980 then
      'images/marker3-8.png'
    elsif self.year <= 2000 then
      'images/marker2-8.png'
    else
      'images/marker1-8.png'
    end
  end

  def wareki
    Date.civil(self.year, 1, 1).strftime("%Jy年 ( %Y 年)")
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
