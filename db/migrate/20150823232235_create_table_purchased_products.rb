class CreateTablePurchasedProducts < ActiveRecord::Migration
  def change
    create_table :purchased_products do |t|
      t.integer :base_product_id
      t.float :price
      t.integer :amount
    end
  end
end
