class AddLevelToStudentRoom < ActiveRecord::Migration
  def change
    add_column :student_rooms, :level, :string
  end
end
