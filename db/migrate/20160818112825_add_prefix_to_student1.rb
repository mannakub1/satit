class AddPrefixToStudent1 < ActiveRecord::Migration
  def change
    add_column :students, :prefix, :string
  end
end
