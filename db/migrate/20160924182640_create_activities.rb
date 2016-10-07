class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :course_list_id
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
