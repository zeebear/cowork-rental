class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :office_id, foreign_key: true
      t.references :user_id, foreign_key: true
      t.string :status
      t.date :starting_date
      t.date :ending_date

      t.timestamps
    end
  end
end
