class AddSlugToManagers < ActiveRecord::Migration[5.2]
  def change
    add_column :managers, :slug, :string
    add_index :managers, :slug, unique: true
  end
end
