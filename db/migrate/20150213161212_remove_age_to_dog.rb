class RemoveAgeToDog < ActiveRecord::Migration
  def change
  	remove_column :dogs, :age
  end
end
