class ChangeNameToLatLgn < ActiveRecord::Migration[5.2]
  def change
    rename_column :offices, :lat, :latitude
    rename_column :offices, :long, :longitude
  end
end
