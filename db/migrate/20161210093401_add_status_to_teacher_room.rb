class AddStatusToTeacherRoom < ActiveRecord::Migration
  def change
    add_column :teacher_rooms, :status, :boolean
  end
end
