class AddChaneNameToAdmins < ActiveRecord::Migration
  def up
    rename_column :admins, :password, :password_digest
  end
end
