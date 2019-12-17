class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name, null: false, default: ''
      t.string :short_code, null: false, default: ''
      t.string :phone_code, null: true, default: ''
      t.timestamps

    end
    add_index :countries, :short_code, unique: true
  end
end
