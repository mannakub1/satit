class DeleteGpaToStudent < ActiveRecord::Migration
  def change
    remove_column :students, :gpa
  end
end
