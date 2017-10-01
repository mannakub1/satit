class AddThumbToStudent < ActiveRecord::Migration
  def change
    add_column :students, :thumb, :string, default:""
  end
end
