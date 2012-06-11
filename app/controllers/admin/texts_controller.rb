class Admin::TextsController < Admin::ApplicationController
  before_filter :load_taxonomies, only: [:new, :edit]

  def index
    @texts = ::TextDecorator.decorate(Text.order("id desc").all)
  end

  def show
    @text = Text.find(params[:id])
  end

  def new
    @text = Text.new
  end

  def edit
    @text = Text.find(params[:id])
    @selected_taxonomy = @text.taxonomy_id
  end

  def create
    @text = Text.new(params[:text])
    define_publishing_state

    if @text.save
      redirect_to admin_texts_path, notice: 'Text was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @text = Text.find(params[:id])
    define_publishing_state

    if @text.update_attributes(params[:text])
      redirect_to admin_texts_path, notice: 'Text was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy

    respond_to do |format|
      format.html { redirect_to admin_texts_url }
      format.json { head :no_content }
    end
  end

private
  
  def load_taxonomies
    @taxonomies = Taxonomy.all
  end

  def define_publishing_state
    if params[:commit] == "Publish"
      @text.published = true
    else
      @text.published = false
    end
  end
end
