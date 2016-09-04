class AddLogingToTeacher < ActiveRecord::Migration
  def change
    add_column :adults, :prefix, :string
    add_column :teachers, :username, :string
    add_column :teachers, :password_digest, :string
  end
end
