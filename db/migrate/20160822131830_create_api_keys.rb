class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.datetime :expires_at
      t.integer :student_id
      t.boolean :active

      t.timestamps null: false
    end

    add_index :api_keys, ["student_id"], name: "index_api_keys_on_student_id", unique: false
    add_index :api_keys, ["access_token"], name: "index_api_keys_on_access_token", unique: true
  end
end
