class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.integer :adult_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
