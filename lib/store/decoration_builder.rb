class DecorationBuilder
  def self.text(resource)
    if resource.respond_to?(:each)
      TextDecorator.decorate_collection(resource)
    else
      TextDecorator.decorate(resource)
    end
  end
end
