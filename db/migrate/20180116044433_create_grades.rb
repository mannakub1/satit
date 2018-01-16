class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.float :gpax
      t.float :cr
      t.float :cp
      t.float :ca

      t.timestamps null: false
    end
  end
end
