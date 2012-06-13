class ApplicationController; end
class DecorationBuilder; end
class Taxonomy; end

require './app/controllers/home_controller'

describe HomeController do
  subject { HomeController.new }

  describe "#index" do
    before do
      DecorationBuilder.stub(:text)
    end

    describe "decoration builders" do
      it "builds the software texts decorations" do
        subject.stub(:load_text).and_return("software")
        DecorationBuilder.should_receive(:text).with("software")
        subject.index
      end
    end
  end
end
