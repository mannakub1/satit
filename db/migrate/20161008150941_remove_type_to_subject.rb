class RemoveTypeToSubject < ActiveRecord::Migration
  def change
    remove_column :subjects, :type
  end
end
