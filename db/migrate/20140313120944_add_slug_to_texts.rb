class AddSlugToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :slug, :string
    add_index :texts, :slug, unique: true
  end
end
