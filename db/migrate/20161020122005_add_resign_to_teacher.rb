class AddResignToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :resign, :boolean
  end
end
