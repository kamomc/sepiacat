class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  # GET /spots
  # GET /spots.json
  def index
    @q = Spot.ransack(search_params)
    @spots = @q.result
  end

  # GET /spots/1
  # GET /spots/1.json
  def show
  end

  # GET /spots/new
  def new
    @spot = Spot.new
  end

  # GET /spots/1/edit
  def edit
  end

  # POST /spots
  # POST /spots.json
  def create
    respond_to do |format|
      if can? :create, Spot
        @spot = Spot.new(spot_params)

        if @spot.save
          format.html {redirect_to @spot, notice: 'スポット情報を作成しました。'}
          format.json {render :show, status: :created, location: @spot}
        else
          format.html {render :new}
          format.json {render json: @spot.errors, status: :unprocessable_entity}
        end
      else
        format.html {redirect_to @spot, notice: 'スポット情報を作成する権限がありません。'}
      end
    end
  end

  # PATCH/PUT /spots/1
  # PATCH/PUT /spots/1.json
  def update
    respond_to do |format|
      if can? :update, Spot
        if @spot.update(spot_params)
          format.html {redirect_to @spot, notice: 'スポット情報を更新しました。'}
          format.json {render :show, status: :ok, location: @spot}
        else
          format.html {render :edit}
          format.json {render json: @spot.errors, status: :unprocessable_entity}
        end
      else
        format.html {redirect_to @spot, alert: 'スポット情報を更新する権限がありません。'}
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.json
  def destroy
    respond_to do |format|
      if can? :destroy, Spot
        @spot.destroy
        format.html {redirect_to spots_url, notice: 'スポット情報を削除しました。'}
        format.json {head :no_content}
      else
        format.html {redirect_to spots_url, alert: 'スポットを削除する権限がありません。'}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_spot
    @spot = Spot.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def spot_params
    params.require(:spot).permit(:name, :image, :latitude, :longitude, :year, :comment, :license, :remove_image, :image_cache)
  end

  def search_params
    if params[:q] == nil then
      []
    else
      params[:q].to_unsafe_h
    end
  end
end
