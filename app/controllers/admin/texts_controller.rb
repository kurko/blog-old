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

    respond_to do |format|
      if @text.save
        format.html { redirect_to admin_texts_path, notice: 'Text was successfully created.' }
        format.json { render json: @text, status: :created, location: @text }
      else
        format.html { render action: "new" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /texts/1
  # PUT /texts/1.json
  def update
    @text = Text.find(params[:id])

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to admin_texts_path, notice: 'Text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
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
end
