class TextsController < ApplicationController
  def index
  end

  def show
    @text = ::TextDecorator.decorate(Text.find(params[:id]))
  end
end
