class AddIdenNumberOfAdult < ActiveRecord::Migration
  def change
    add_column :adults, :iden_number, :string
  end
end
