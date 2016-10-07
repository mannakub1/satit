class CreateCourseLists < ActiveRecord::Migration
  def change
    create_table :course_lists do |t|
      t.integer :course_id
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
