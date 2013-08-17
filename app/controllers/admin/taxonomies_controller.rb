class Admin::TaxonomiesController < Admin::ApplicationController
  # GET /taxonomies
  # GET /taxonomies.json
  def index
    @taxonomies = Taxonomy::Persistence.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @taxonomies }
    end
  end

  # GET /taxonomies/1
  # GET /taxonomies/1.json
  def show
    @taxonomy = Taxonomy::Persistence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @taxonomy }
    end
  end

  # GET /taxonomies/new
  # GET /taxonomies/new.json
  def new
    @taxonomy = Taxonomy::Persistence.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @taxonomy }
    end
  end

  # GET /taxonomies/1/edit
  def edit
    @taxonomy = Taxonomy::Persistence.find(params[:id])
  end

  # POST /taxonomies
  # POST /taxonomies.json
  def create
    @taxonomy = Taxonomy::Persistence.new(params[:taxonomy])

    respond_to do |format|
      if @taxonomy.save
        format.html { redirect_to admin_taxonomies_url, notice: 'Taxonomy was successfully created.' }
        format.json { render json: @taxonomy, status: :created, location: @taxonomy }
      else
        format.html { render "new" }
        format.json { render json: @taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /taxonomies/1
  # PUT /taxonomies/1.json
  def update
    @taxonomy = Taxonomy::Persistence.find(params[:id])

    respond_to do |format|
      if @taxonomy.update_attributes(params[:taxonomy])
        format.html { redirect_to admin_taxonomies_url, notice: 'Taxonomy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @taxonomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxonomies/1
  # DELETE /taxonomies/1.json
  def destroy
    @taxonomy = Taxonomy::Persistence.find(params[:id])
    @taxonomy.destroy

    respond_to do |format|
      format.html { redirect_to admin_taxonomies_url }
      format.json { head :no_content }
    end
  end
end
