class AddIdenToStudent < ActiveRecord::Migration
  def change
    add_column :students, :iden_number, :string
  end
end
