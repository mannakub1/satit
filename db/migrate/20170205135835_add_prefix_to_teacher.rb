class AddPrefixToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :prefix, :string
  end
end
