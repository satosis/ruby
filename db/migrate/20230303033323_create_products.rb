class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :pro_name
      t.integer :pro_amount, default: 100
      t.integer :pro_view, default: 0
      t.string :pro_slug, null: true
      t.integer :pro_price, default: 0
      t.integer :pro_sale, default: 0
      t.references :category, foreign_key: {to_table: :categories}
      t.integer :pro_favourite, default: 0
      t.string :pro_avatar, null: true
      t.integer :pro_hot, default: 0
      t.integer :pro_active, default: 0
      t.references :admin, foreign_key: {to_table: :admins}
      t.integer :pro_pay, default: 0
      t.text :pro_description, null: true
      t.text :pro_content, null: true
      t.integer :pro_review_total, default: 0
      t.integer :pro_review_star, default: 5
      t.string :keywordseo, null: true
      t.string :_wysihtml5_mode, null: true

      t.timestamps
    end
  end
end
