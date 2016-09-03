class CreateAdults < ActiveRecord::Migration
  def change
    create_table :adults do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :call
      t.string :zip_code
      t.string :enthicity
      t.string :district
      t.string :parish
      t.string :city

      t.timestamps null: false
    end
  end
end
