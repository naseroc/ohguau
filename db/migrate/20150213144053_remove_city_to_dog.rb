class RemoveCityToDog < ActiveRecord::Migration
  def change
  	remove_column :dogs, :city
  end
end
