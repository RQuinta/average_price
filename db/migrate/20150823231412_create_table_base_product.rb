class CreateTableBaseProducts < ActiveRecord::Migration
  def change
    create_table :table_base_products do |t|
      t.string :name
      t.float :average_price, :default => 0.0
      t.timestamps
    end
  end
end
