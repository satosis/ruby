class CreateProductImages < ActiveRecord::Migration[7.0]
  def change
    create_table :product_images do |t|
      t.string :al_name
      t.string :al_slug, null: true
      t.references :product, foreign_key: {to_table: :products}

      t.timestamps
    end
  end
end
