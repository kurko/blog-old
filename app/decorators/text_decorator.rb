class TextDecorator < ApplicationDecorator
  decorates :text

  def created_at
    text.created_at.strftime("%m/%d/%Y %l:%M%P")
  end

  def taxonomy
    text.taxonomy.name if text.taxonomy.present?
  end

  def content
    text.content.gsub(/\n/, "<br />")
  end
end
