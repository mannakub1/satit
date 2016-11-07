class AddFullNameToCourseList < ActiveRecord::Migration
  def change
    add_column :course_lists, :full_name, :string
  end
end
