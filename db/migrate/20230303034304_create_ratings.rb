class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: {to_table: :users}
      t.references :product, foreign_key: {to_table: :products}
      t.integer :number, default: 0
      t.integer :status, default: 0
      t.text :content, null: true

      t.timestamps
    end
  end
end
