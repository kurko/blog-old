require 'spec_helper'

describe Admin::TextsController do
  login_user

  describe "GET index" do
    it "should instantiate a new text" do
      Text.stub(:new).and_return("a new text")
      get :new
      assigns(:text).should == "a new text"
    end
  end

  describe "POST create" do
    before do
      @text = double
      @text.stub(:save)
      @text.stub(:published=)
      Text.stub(:new).and_return(@text)
    end

    it "instantiate a new Text" do
      post :create, { whatever: true }
      assigns(:text).should == @text
    end

    it "redirects if text is saved" do
      @text.stub(:save).and_return(true)
      post :create, { whatever: true }
      response.should redirect_to admin_texts_path
    end

    it "render form if text is not saved" do
      @text.stub(:save).and_return(false)
      post :create, { whatever: true }
      response.should render_template "new"
    end

    context "regarding published and drafts" do
      it "publishes texts" do
        @text.should_receive(:published=).with(true)
        post :create, { commit: "Publish" }
      end

      it "save texts as drafts" do
        @text.should_receive(:published=).with(false)
        post :create, { commit: "Save as draft" }
      end
    end
  end

  describe "PUT update" do
    before do
      @text = double
      @text.stub(:update_attributes)
      @text.stub(:published=)
      Text.stub(:find).with("1").and_return(@text)
    end

    it "instantiate an existing Text" do
      put :update, id: "1", text: "blablabla"
      assigns(:text).should == @text
    end

    it "redirects if text is updated" do
      @text.stub(:update_attributes).and_return(true)
      put :update, id: "1", text: "blablabla"
      response.should redirect_to admin_texts_path
    end

    it "render form if text is not saved" do
      @text.stub(:update_attributes).and_return(false)
      put :update, id: "1", text: "blablabla"
      response.should render_template "edit"
    end

    context "regarding published and drafts" do
      it "publishes texts" do
        @text.should_receive(:published=).with(true)
        put :update, id: "1", commit: "Publish", text: "blablabla"
      end

      it "save texts as drafts" do
        @text.should_receive(:published=).with(false)
        put :update, id: "1", commit: "Save as draft", text: "blablabla"
      end
    end
  end
end
