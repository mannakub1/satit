class AddGpaxToStudent < ActiveRecord::Migration
  def change
    add_column :students, :cr, :integer
    add_column :students, :cp, :integer
    add_column :students, :ca, :integer
    add_column :students, :gp, :float
    add_column :students, :gpa, :float
  end
end
