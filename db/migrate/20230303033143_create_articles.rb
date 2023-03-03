class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :a_name
      t.string :a_slug, null: true
      t.integer :a_hot, default: 0
      t.integer :a_active, default: 1
      t.integer :a_view, default: 0
      t.text :a_description, null: true
      t.text :a_avatar, null: true
      t.text :a_content, null: true
      t.integer :_wysihtml5_mode, null: true

      t.timestamps
    end
  end
end
