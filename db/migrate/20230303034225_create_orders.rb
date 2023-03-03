class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :transaction, foreign_key: {to_table: :transactions}
      t.references :product, foreign_key: {to_table: :products}
      t.integer :sale, default: 0
      t.integer :qty, default: 0
      t.float :price, default: 0

      t.timestamps
    end
  end
end
