class TextDecorator < ApplicationDecorator
  decorates :text

  def created_at
    text.created_at.strftime("%m/%d/%Y %l:%M%P")
  end

  def taxonomy
    text.taxonomy.name if text.taxonomy.present?
  end

  def content
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render text.content
  end

  def published_status
    " (not published)" unless text.published == true
  end
end
