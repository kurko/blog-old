class Text < ActiveRecord::Base
  attr_accessible :author_id, :content, :description, :title
end
