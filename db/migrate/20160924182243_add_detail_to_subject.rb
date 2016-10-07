class AddDetailToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :code, :string
    add_column :subjects, :hour_per_year, :string
  end
end
