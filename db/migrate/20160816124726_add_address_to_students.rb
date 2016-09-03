class AddAddressToStudents < ActiveRecord::Migration
  def change
    add_column :students, :district, :string
    add_column :students, :parish, :string
    add_column :students, :city, :string
  end
end
