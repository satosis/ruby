class CreateProductKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :product_keywords do |t|
      t.references :product, foreign_key: {to_table: :products}
      t.references :keyword, foreign_key: {to_table: :keywords}

      t.timestamps
    end
  end
end
