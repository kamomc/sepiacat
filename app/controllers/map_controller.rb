class MapController < ApplicationController
  def show
    @markers = []
    for spot in Spot.all do
      marker = {
          :latlng => [spot.latitude, spot.longitude],
          :popup => view_context.link_to(spot.name, spot_path(spot)),
          :icon => {
              :icon_url => 'spots/images/pin.png',
              :popup_anchor => [14,0]
          }
      }
      @markers.push(marker)
    end
  end
end
