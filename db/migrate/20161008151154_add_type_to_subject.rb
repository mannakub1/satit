class AddTypeToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :type, :string
  end
end
