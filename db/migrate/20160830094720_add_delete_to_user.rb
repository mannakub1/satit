class AddDeleteToUser < ActiveRecord::Migration
  def change
    add_column :students, :delete_status, :string
  end
end
