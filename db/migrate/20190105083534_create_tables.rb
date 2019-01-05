class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :min_capacity
      t.integer :max_capacity
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
