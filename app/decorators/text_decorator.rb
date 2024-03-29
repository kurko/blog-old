require 'blog/red_carpet_extended'

class TextDecorator < ApplicationDecorator
  decorates :text
  delegate_all

  def created_at
    model.created_at.strftime("%m/%d/%Y %l:%M%P")
  end

  def taxonomy
    model.taxonomy.name if model.taxonomy.present?
  end

  def body
    markdown = Redcarpet::Markdown.new(
      ::Blog::RedCarpetExtended,
      autolink: true,
      space_after_headers: true
    )
    markdown.render model.body
  end

  def published_status
    " (not published)" unless model.published == true
  end
end
