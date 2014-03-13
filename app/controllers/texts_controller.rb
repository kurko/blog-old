class TextsController < ApplicationController
  def index
  end

  def show
    @controller = DecorationBuilder.text(Text::Persistence.friendly.find(text_id))
  end

private

  def text_id
    params[:id]
  end
end
