class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :user, null: false, index: true
      t.string :bill_type, null: false
      t.float :amount, null: false, default: 0.0
      t.decimal :percent, default: 0.0
      t.datetime :close_at, null: false
      t.datetime :replenishment_at, null: true
      t.float :regular_replenishment_amount, default: 0.0
      t.datetime :expired_bill_at, null: true
      t.boolean :close_status, default: true
      t.float :amount_limit, null: false, default: 0.0
      t.timestamps
    end
  end

end
