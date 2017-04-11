class MapController < ApplicationController
  def show
    @q = Spot.ransack(search_params)
    @markers = []
    for spot in @q.result do
      @markers.push(spot.marker)
    end
  end

  private
  def search_params
    if params[:q] == nil then
      []
    else
      params[:q].to_unsafe_h
    end
  end
end
