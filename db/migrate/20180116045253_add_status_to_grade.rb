class AddStatusToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :status, :string
  end
end
