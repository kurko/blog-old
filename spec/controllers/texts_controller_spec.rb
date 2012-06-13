class ApplicationContentsController; end
class Text; end
class DecorationBuilder; end

require './app/controllers/texts_controller'

describe TextsController do
  before do
    @controller = TextsController.new
  end

  describe "#show" do
    before do
      @controller.stub(:text_id).and_return(:id)
      Text.stub(:find).with(:id).and_return(:my_text)
    end

    it "should decorate the text object" do
      DecorationBuilder.should_receive(:text)
                       .with(:my_text)
                       .and_return(:my_text)
      @controller.show.should == :my_text
    end
  end
end
