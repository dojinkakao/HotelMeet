class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :start
      t.date :end
      t.integer :number_of_people

      t.timestamps
    end
  end
end
