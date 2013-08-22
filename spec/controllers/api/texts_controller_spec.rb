require "spec_helper"

describe Api::TextsController do
  let(:taxonomy) { create(:taxonomy, name: "Software") }

  describe "#index" do
    before do
      create(:text, title: "titlee", content: "contentt", taxonomy: taxonomy)
    end

    it "returns the existing articles" do
      xhr :get, :index, category: "Software"

      json = ActiveSupport::JSON.decode(response.body)
      json.keys.should == ["texts"]

      json = json["texts"].first
      json["title"].should == "titlee"
      json["content"].should == "contentt"
      json["description"].should == "This is a description"
    end
  end
end
