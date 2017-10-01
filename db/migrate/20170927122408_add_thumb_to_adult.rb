class AddThumbToAdult < ActiveRecord::Migration
  def change
    add_column :adults, :thumb, :string, default:"img/student/avatar.png"
  end
end
