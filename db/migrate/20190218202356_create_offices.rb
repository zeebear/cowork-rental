class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :location
      t.string :coordinates
      t.integer :price
      t.string :type
      t.references :user, foreign_key: true
      t.integer :number_of_seats
      t.boolean :coffee
      t.boolean :wifi
      t.boolean :lockers
      t.boolean :kitchen

      t.timestamps
    end
  end
end
