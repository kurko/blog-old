class TextSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :body

  def body
    object.body
  end
end
