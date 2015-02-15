class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.integer :like
      t.integer :mydog_id
      t.integer :otherdog_id

      t.timestamps null: false
    end
  end
end
