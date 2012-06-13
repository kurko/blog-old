class Text < ActiveRecord::Base
  attr_accessible :author_id, :content, :description, :title
  attr_accessible :published
  attr_accessible :taxonomy_id
  attr_accessible :taxonomy_attributes

  belongs_to :taxonomy
  accepts_nested_attributes_for :taxonomy

  scope :published_texts, where("texts.published = ?", true)
end
