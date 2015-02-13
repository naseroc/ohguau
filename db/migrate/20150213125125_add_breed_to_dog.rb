class AddBreedToDog < ActiveRecord::Migration
  def change
    add_reference :dogs, :breed, index: true
    add_foreign_key :dogs, :breeds
  end
end
