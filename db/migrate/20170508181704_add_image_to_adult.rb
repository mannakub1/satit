class AddImageToAdult < ActiveRecord::Migration
  def change
    add_column :adults, :image, :string
  end
end
