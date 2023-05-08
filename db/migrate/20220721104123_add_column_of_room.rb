class AddColumnOfRoom < ActiveRecord::Migration[5.2]
  def change
    change_column_null :rooms, :id, false, 0
  end
end
