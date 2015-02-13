class AddAgeToDog < ActiveRecord::Migration
  def change
    add_reference :dogs, :age, index: true
    add_foreign_key :dogs, :ages
  end
end
