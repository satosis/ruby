class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email, null: true
      t.string :password, null: true

      t.timestamps
    end
  end
end
