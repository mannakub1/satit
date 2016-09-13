class AddNationalityToAdult < ActiveRecord::Migration
  def change
    add_column :adults, :nationality, :string
  end
end
