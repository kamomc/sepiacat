class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :image
      t.decimal :latitude
      t.decimal :longitude
      t.integer :year
      t.text :comment

      t.timestamps
    end
  end
end
