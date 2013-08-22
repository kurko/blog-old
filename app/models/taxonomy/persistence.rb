module Taxonomy
  class Persistence < ActiveRecord::Base
    self.table_name = "taxonomies"

    attr_accessible :name

    has_many :texts,
      foreign_key: "taxonomy_id",
      class_name: "Text::Persistence"

    def self.find_by_name_with_texts(taxonomy)
      taxonomy = includes(:texts).where(name: taxonomy).first
      if taxonomy.texts.published_texts.present?
        taxonomy.texts.published_texts.order("id desc").to_a
      else
        []
      end
    end
  end
end
