class HomeController < ApplicationController
  def index
    @softwares = ::TextDecorator.decorate(Taxonomy.where(name: "Software").first.texts)
    @essays = ::TextDecorator.decorate(Taxonomy.where(name: "Essays").first.texts)
    @personals = ::TextDecorator.decorate(Taxonomy.where(name: "Personal").first.texts)
  end
end
