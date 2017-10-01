class AddStatusShowGradeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :status_show_grades, :boolean
  end
end
