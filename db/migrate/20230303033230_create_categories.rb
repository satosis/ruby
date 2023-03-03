class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :c_name
      t.string :c_slug
      t.string :c_cate, null: true

      t.timestamps
    end
  end
end
