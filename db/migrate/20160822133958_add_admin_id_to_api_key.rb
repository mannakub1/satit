class AddAdminIdToApiKey < ActiveRecord::Migration
  def change
    add_column :api_keys, :admin_id, :integer
  end
end
