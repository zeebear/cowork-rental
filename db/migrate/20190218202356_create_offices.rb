class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :location
      t.string :coordinates
      t.integer :price
      t.string :workspace_type
      t.references :user, foreign_key: true
      t.integer :number_of_seats, default: 1
      t.boolean :coffee, default: false
      t.boolean :wifi, default: false
      t.boolean :lockers, default: false
      t.boolean :kitchen, default: false

      t.timestamps
    end
  end
end
