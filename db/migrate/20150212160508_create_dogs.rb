class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.string :size
      t.string :sex
      t.text :description
      t.string :city
      t.string :commune
      t.string :photo
      t.string :nextperiod
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :dogs, :users
  end
end
