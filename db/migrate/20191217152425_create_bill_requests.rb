class CreateBillRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_requests do |t|
      t.references :manager, index: true
      t.references :bill, index: true
      t.date :approved_at
      t.boolean :approved_status, default: false
      t.string :message, null: false
      t.timestamps
    end
  end
end
