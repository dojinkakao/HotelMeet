class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.integer :price
      t.text :address
      t.text :about
      t.string :image_id

      t.timestamps
    end
  end
end
