class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :sender, null: false, index: true
      t.references :recipient, null: false, index: true
      t.float :amount, null: false
      t.boolean :status
      t.timestamps
    end
    add_foreign_key :transactions, :bills, column: :sender_id, primary_key: :id
    add_foreign_key :transactions, :bills, column: :recipient_id, primary_key: :id
  end
end
