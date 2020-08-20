class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :party_size
      t.string :date
      t.integer :user_id
      t.integer :restaurant_id
    end
  end
end
