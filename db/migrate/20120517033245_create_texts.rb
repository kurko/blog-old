class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.text :title
      t.text :description
      t.text :content
      t.integer :author_id

      t.timestamps
    end
  end
end
