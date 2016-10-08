class RemoveColumnToCourseList < ActiveRecord::Migration
  def change
    remove_column :course_lists, :room_id
    add_column :course_lists, :room_level, :string
  end
end
