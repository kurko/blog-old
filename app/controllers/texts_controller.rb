class TextsController < ApplicationContentsController
  def index
  end

  def show
    @text = DecorationBuilder.text(Text.find(text_id))
  end

private

  def text_id
    params[:id]
  end
end
