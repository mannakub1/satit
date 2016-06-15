class CreateStudentRooms < ActiveRecord::Migration
  def change
    create_table :student_rooms do |t|
      t.references :student, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
