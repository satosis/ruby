class CreateKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :keywords do |t|
      t.string :k_name
      t.string :k_slug, null: true
      t.string :k_description, null: true
      t.integer :k_hot, default: 0
      t.integer :k_active, default: 0

      t.timestamps
    end
  end
end
