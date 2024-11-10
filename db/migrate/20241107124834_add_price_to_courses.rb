class AddPriceToCourses < ActiveRecord::Migration[7.2]
  def change
    add_column :courses, :price, :integer
  end
end
