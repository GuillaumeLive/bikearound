class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :rating
      t.date :start_at
      t.date :end_at
      t.boolean :state

      t.timestamps
    end
  end
end
