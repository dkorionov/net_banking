class CreateManagerNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_notifications do |t|
      t.references :manager, index: true
      t.references :bill, index: true
      t.string :message, null: false
      t.timestamps
    end
  end
end
