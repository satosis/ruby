class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: {to_table: :users}
      t.float :tst_total_money, default: 0
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :note, null: true
      t.integer :status, default: 1
      t.integer :type, default: 1
      t.string :code

      t.timestamps
    end
  end
end
