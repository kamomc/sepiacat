json.extract! spot, :id, :name, :image, :latitude, :longitude, :year, :comment, :created_at, :updated_at
json.url spot_url(spot, format: :json)
