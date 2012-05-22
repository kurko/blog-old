class TextDecorator < ApplicationDecorator
  decorates :text

  def created_at
    text.created_at.strftime("%m/%d/%Y %l:%M%P")
  end
end
