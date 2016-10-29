class AddStatusToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :status, :string
  end
end
