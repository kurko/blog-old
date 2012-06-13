class TextDecorator; end

require "./lib/store/decoration_builder"

describe DecorationBuilder do
  subject { DecorationBuilder }

  describe ".text" do
    it "should instantiate a text decorator" do
      TextDecorator.should_receive(:decorate).with(:resource)
      subject.text(:resource)
    end
  end
end
