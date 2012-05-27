class Taxonomy < ActiveRecord::Base
  attr_accessible :name

  has_many :texts
end
