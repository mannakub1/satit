class AddReferenceToRooms < ActiveRecord::Migration
  def change
    add_reference :teachers, :room, index: true, foreign_key: true
    add_column :rooms, :student_id, :integer, array: true, default: []
  end
end
