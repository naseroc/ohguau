class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :dog_one
      t.integer :dog_two

      t.timestamps null: false
    end
  end
end
