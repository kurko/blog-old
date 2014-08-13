module Blog
  class RedCarpetExtended < ::Redcarpet::Render::HTML
    include ActionView::Helpers::AssetTagHelper

    def image(link, title, alt_text, css_class = nil)
      css_class = "with_caption" if alt_text.present?
      result = image_tag(link, title: title, alt: alt_text, class: css_class)

      result << content_tag(:div, alt_text, class: "image_caption") if alt_text.present?
      result
    end
  end
end
