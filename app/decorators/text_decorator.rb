class TextDecorator < ApplicationDecorator
  decorates :text
  delegate_all

  def created_at
    model.created_at.strftime("%m/%d/%Y %l:%M%P")
  end

  def taxonomy
    model.taxonomy.name if model.taxonomy.present?
  end

  def content
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render model.content
  end

  def published_status
    " (not published)" unless model.published == true
  end
end
