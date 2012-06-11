class AddPublishedToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :published, :boolean, :default => true
  end
end
