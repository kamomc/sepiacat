class MapController < ApplicationController
  def show
    @markers = []
    for spot in Spot.all do
      @markers.push(spot.marker)
    end
  end
end
