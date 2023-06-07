class AddSlugToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :slug, :string
    add_index :items, :slug, unique: true
  end
end
