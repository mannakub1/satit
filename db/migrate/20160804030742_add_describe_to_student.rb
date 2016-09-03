class AddDescribeToStudent < ActiveRecord::Migration
  def change
    add_column :students, :blood, :string
    add_column :students, :birthdate, :datetime
    add_column :students, :address, :string
    add_column :students, :call, :string
    add_column :students, :zip_code, :string
    add_column :students, :ability, :string
  end
end
