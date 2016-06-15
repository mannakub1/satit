class AddTeacherIdToRoom < ActiveRecord::Migration
  def change
    add_reference :rooms, :teacher, index: true, foreign_key: true
  end
end
