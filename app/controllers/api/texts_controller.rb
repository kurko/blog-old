class Api::TextsController < Api::ApplicationController
  def index
    @texts = Text::Persistence.published_texts.by_category(params[:category]).to_a
    @texts = TextDecorator.decorate_collection(@texts)
    @texts = @texts.map { |t| TextSerializer.new(t) }
    render json: {texts: @texts}
  end

  def show
    @text = Text::Persistence.published_texts.find(params[:id])
    @text = TextDecorator.decorate(@text)
    render json: @text, root: "text", serializer: TextSerializer
  end
end
