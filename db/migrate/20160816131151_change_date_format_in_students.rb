class ChangeDateFormatInStudents < ActiveRecord::Migration
  def up
    change_column :students, :birthdate, :datetime
  end

  def down
    change_column :students, :birthdate, :date
  end
end
