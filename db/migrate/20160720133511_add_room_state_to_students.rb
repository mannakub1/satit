class AddRoomStateToStudents < ActiveRecord::Migration
  def change
    add_column :students, :room_state, :boolean
  end
end
