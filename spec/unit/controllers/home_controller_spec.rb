class ApplicationController; end
class DecorationBuilder; end
module Taxonomy; class Persistence; end; end

require './app/controllers/home_controller'

describe HomeController do
  subject { HomeController.new }

  describe "#index" do
    before do
      DecorationBuilder.stub(:text)
      Taxonomy::Persistence.stub(:find_by_name_with_texts)
    end

    describe "decoration builders" do
      before do
        subject.stub(:load_essay_texts)
        subject.stub(:load_personal_texts)
      end

      it "builds the software texts decorations" do
        subject.stub(:load_texts).and_return("software")
        DecorationBuilder.should_receive(:text).with("software")
        subject.index
      end
    end
  end
end
