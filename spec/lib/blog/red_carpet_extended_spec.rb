require "spec_helper"

describe Blog::RedCarpetExtended do
  subject { Redcarpet::Markdown.new(described_class) }

  describe '#image' do
    context "no alt text" do
      it "returns the default HTML element" do
        result = subject.render("![](haha.jpg)")
        result.should == "<p><img src=\"/images/haha.jpg\" /></p>\n"
      end
    end

    context "with alt text" do
      it "returns the default HTML element plus caption" do
        result = subject.render("![caption caption](haha.jpg)")
        result.should == "<p><img alt=\"caption caption\" class=\"with_caption\" src=\"/images/haha.jpg\" /><div class=\"image_caption\">caption caption</div></p>\n"
      end
    end
  end
end
