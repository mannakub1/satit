class AddCreditToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :credit, :float
  end
end
