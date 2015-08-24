class CreateTablePurchasedProducts < ActiveRecord::Migration
  def change
    create_table :table_purchased_products do |t|
      t.integer :base_product_id
      t.float :price
      t.integer :amount
    end
  end
end
