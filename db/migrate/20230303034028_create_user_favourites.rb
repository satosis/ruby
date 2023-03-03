class CreateUserFavourites < ActiveRecord::Migration[7.0]
  def change
    create_table :user_favourites do |t|
      t.references :product, foreign_key: {to_table: :products}
      t.references :user, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
