class AddCodeNumberToStudentRoom < ActiveRecord::Migration
  def change
    add_column :student_rooms, :code_number, :string
  end
end
