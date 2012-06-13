class Taxonomy < ActiveRecord::Base
  attr_accessible :name

  has_many :texts

  def self.find_by_name_with_published_texts
    
  end
end
