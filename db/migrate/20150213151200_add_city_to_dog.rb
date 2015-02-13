class AddCityToDog < ActiveRecord::Migration
  def change
  	add_reference :dogs, :city, index: true
    add_foreign_key :dogs, :cities
  end
end
