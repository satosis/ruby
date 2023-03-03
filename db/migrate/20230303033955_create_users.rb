class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider, null: true
      t.string :provider_id, null: true
      t.string :email, null: true
      t.string :phone, null: true
      t.string :address, null: true
      t.string :password, null: true
      t.string :avatar, null: true
      t.string :remember_token, null: true
      t.date :birthday, null: true
      t.integer :gender, default:0

      t.timestamps
    end
  end
end
