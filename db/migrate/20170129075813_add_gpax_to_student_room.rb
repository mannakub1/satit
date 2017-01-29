class AddGpaxToStudentRoom < ActiveRecord::Migration
  def change
    add_column :student_rooms, :cr, :integer
    add_column :student_rooms, :cp, :integer
    add_column :student_rooms, :ca, :integer
    add_column :student_rooms, :gp, :float
    add_column :student_rooms, :gpa, :float
  end
end
