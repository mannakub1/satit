class AddGpax2ToStudentRoom < ActiveRecord::Migration
  def change
    add_column :student_rooms, :gpax, :float
    add_column :student_rooms, :crx, :float
    add_column :student_rooms, :cpx, :float
    add_column :student_rooms, :cax, :float
  end
end
