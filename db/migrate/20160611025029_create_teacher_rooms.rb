class CreateTeacherRooms < ActiveRecord::Migration
  def change
    create_table :teacher_rooms do |t|
      t.references :teacher, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
