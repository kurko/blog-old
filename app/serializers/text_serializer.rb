class TextSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :content
end
