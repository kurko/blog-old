class DecorationBuilder
  def self.text(resource)
    TextDecorator.decorate(resource)
  end
end
