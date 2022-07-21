class ChangeColumnsAddNotnullToTask < ActiveRecord::Migration[5.2]

  def up
    change_column_null :reservations, :room_id, true, nil
    change_column :reservations, :room_id, :integer, default: nil
  end

  def down
    change_column_null :reservations, :room_id, false, 0
    change_column :reservations, :room_id, :integer, default: 0
  end
end
