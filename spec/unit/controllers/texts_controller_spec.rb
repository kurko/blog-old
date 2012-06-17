class ApplicationContentsController; end
module Text; class Persistence; end; end
class DecorationBuilder; end

require './app/controllers/texts_controller'

describe TextsController do
  before do
    @controller = TextsController.new
  end

  describe "#show" do
    before do
      @controller.stub(:text_id).and_return(:id)
      Text::Persistence.stub(:find).with(:id).and_return(:my_text)
    end

    it "should decorate the text object" do
      DecorationBuilder.stub(:text)
                       .with(:my_text)
                       .and_return(:my_text)
      @controller.show.should == :my_text
    end
  end
end
