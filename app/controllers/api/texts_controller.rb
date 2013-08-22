class Api::TextsController < Api::ApplicationController
  def index
    @texts = Text::Persistence.published_texts.by_category(params[:category]).to_a
    render json: {texts: @texts}
  end
end
