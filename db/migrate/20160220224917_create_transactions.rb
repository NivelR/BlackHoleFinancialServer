class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :tag, foreign_key: true
      t.float :amount
      t.integer :amount_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
