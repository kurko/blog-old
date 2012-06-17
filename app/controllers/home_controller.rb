class HomeController < ApplicationController
  def index
    @softwares = load_software_texts
    @essays    = load_essay_texts
    @personals = load_personal_texts
  end

  private

  def load_software_texts
    DecorationBuilder.text(load_texts("Software"))
  end

  def load_essay_texts
    DecorationBuilder.text(load_texts("Essays"))
  end

  def load_personal_texts
    DecorationBuilder.text(load_texts("Personal"))
  end

  def load_texts taxonomy
    Taxonomy::Persistence.find_by_name_with_texts taxonomy
  end
end
