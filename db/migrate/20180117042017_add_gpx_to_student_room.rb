class AddGpxToStudentRoom < ActiveRecord::Migration
  def change
    add_column :student_rooms, :gpx, :float
  end
end
