class AddPriorityToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :priority, :integer
  end
end
