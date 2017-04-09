class MapController < ApplicationController
  def show
    @q = Spot.search(name_or_comment_cont: search_param)
    @markers = []
    for spot in @q.result do
      @markers.push(spot.marker)
    end
  end


  private
  def search_param
    if params[:q] == nil then
      []
    else
      params.require(:q).permit(:name_or_comment_cont)[:name_or_comment_cont]
    end
  end
end
