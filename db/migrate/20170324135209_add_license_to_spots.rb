class AddLicenseToSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :license, :integer
  end
end
