module Text; class Persistence; end; end
class DecorationBuilder; end

require 'unit_spec_helper'
require './app/controllers/admin/texts_controller'

describe Admin::TextsController do
  subject { Admin::TextsController.new }

  describe "GET index" do
    it "returns a new decorated text" do
      Text::Persistence.stub(:all_texts).and_return(:all)
      DecorationBuilder.stub(:text).with(:all).and_return(:text)
      subject.index.should == :text
    end
  end

  describe "#create" do
    before do
      @text = double
      @text.stub(:save)
      @text.stub(:published=)
      Text::Persistence.stub(:new).and_return(@text)
    end

    context "regarding creation" do
      it "redirects if text is saved" do
        @text.stub(:save).and_return(true)
        subject.stub(:admin_texts_path)
        subject.should_receive(:redirect_to)
        subject.create
      end

      it "render form if text is not saved" do
        @text.stub(:save).and_return(false)
        subject.should_receive(:render).with(action: "new")
        subject.create
      end
    end

    context "regarding published and drafts" do
      it "publishes texts" do
        subject.stub(:params).and_return(commit: "Publish")
        @text.should_receive(:published=).with(true)
        subject.create
      end

      it "save texts as drafts" do
        subject.stub(:params).and_return(commit: "Save as draft")
        @text.should_receive(:published=).with(false)
        subject.create
      end
    end
  end

  describe "#update" do
    before do
      @text = double
      @text.stub(:update_attributes)
      @text.stub(:published=)
      Text::Persistence.stub(:find).with("1").and_return(@text)
      subject.stub(:params).and_return(id: "1")
    end

    context "regarding updating" do
      it "redirects if text is updated" do
        @text.stub(:update_attributes).and_return(true)
        subject.stub(:admin_texts_path)
        subject.should_receive(:redirect_to)
        subject.update
      end

      it "render form if text is not saved" do
        @text.stub(:update_attributes).and_return(false)
        subject.should_receive(:render).with(action: "edit")
        subject.update
      end
    end

    context "regarding published and drafts" do
      it "publishes texts" do
        subject.stub(:params).and_return(id: "1", commit: "Publish")
        @text.should_receive(:published=).with(true)
        subject.update
      end

      it "save texts as drafts" do
        subject.stub(:params).and_return(id: "1", commit: "Save as draft")
        @text.should_receive(:published=).with(false)
        subject.update
      end
    end
  end
end
