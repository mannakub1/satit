class AddGpaxToStudent < ActiveRecord::Migration
  def change
    add_column :students, :gpax_primary, :float
    add_column :students, :gpax_secondary, :float
  end
end
