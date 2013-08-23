module Text
  class Persistence < ActiveRecord::Base
    self.table_name = "texts"

    attr_accessible :author_id, :content, :description, :title
    attr_accessible :published
    attr_accessible :taxonomy_id
    attr_accessible :taxonomy_attributes

    belongs_to :taxonomy, class_name: "Taxonomy::Persistence"
    accepts_nested_attributes_for :taxonomy

    scope :published_texts, ->{ where("texts.published = ?", true) }
    scope :all_texts, ->{ order("id desc") }
    scope :by_category, ->(name) {
      includes(:taxonomy)
      .where("taxonomies.name = ?", name)
      .references(:taxonomies)
    }

    def body
      self.content
    end
  end
end
