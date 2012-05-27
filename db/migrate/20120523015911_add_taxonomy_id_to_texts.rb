class AddTaxonomyIdToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :taxonomy_id, :integer
    add_index :texts, :taxonomy_id
  end
end
