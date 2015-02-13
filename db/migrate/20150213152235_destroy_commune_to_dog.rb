class DestroyCommuneToDog < ActiveRecord::Migration
  def change
  	remove_column :dogs, :commune
  end
end
