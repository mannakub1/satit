class AddCodeNumberToStudent < ActiveRecord::Migration
  def change
    add_column :students, :code_number, :string
  end
end
