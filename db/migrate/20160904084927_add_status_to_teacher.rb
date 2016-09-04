class AddStatusToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :status, :string
  end
end
