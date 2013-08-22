require "spec_helper"

describe Text::Persistence do
  let(:software_category) { create(:taxonomy, name: "Software") }
  let(:hardware_category) { create(:taxonomy, name: "Hardware") }

  describe "scope" do
    describe "#by_category" do
      it "returns only items from a given category" do
        text1 = create(:text, taxonomy: software_category)
        text2 = create(:text, taxonomy: hardware_category)

        described_class.by_category("Software").to_a.should == [text1]
        described_class.by_category("Hardware").to_a.should == [text2]
      end
    end
  end
end
