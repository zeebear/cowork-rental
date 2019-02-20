class AddressLatLong < ActiveRecord::Migration[5.2]
  def change
    remove_column :offices, :location, :string
    remove_column :offices, :coordinates, :string
    add_column :offices, :address, :string
    add_column :offices, :lat, :float
    add_column :offices, :long, :float
  end
end
