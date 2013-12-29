require 'spec_helper'

describe EntriesController do

  let(:valid_attributes) { { title: 'My Title', body: 'My body' } }

  describe "GET show" do
    it "assigns the requested entry as @entry" do
      entry = FactoryGirl.create :entry, valid_attributes
      get :show, {:id => entry.to_param}

      assigns(:entry).should eq(entry)
    end
  end

  describe "GET new" do
    it "assigns a new entry as @entry" do
      get :new
      assigns(:entry).should be_a_new(Entry)
    end
  end

  describe "GET edit" do
    it "assigns the requested entry as @entry" do
      entry = Entry.create! valid_attributes
      get :edit, {:id => entry.to_param}
      assigns(:entry).should eq(entry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Entry" do
        expect {
          post :create, {:entry => valid_attributes}
        }.to change(Entry, :count).by(1)
      end

      it "assigns a newly created entry as @entry" do
        post :create, {:entry => valid_attributes}
        assigns(:entry).should be_a(Entry)
        assigns(:entry).should be_persisted
      end

      it "redirects to the created entry" do
        post :create, {:entry => valid_attributes}
        response.should redirect_to(Entry.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved entry as @entry" do
        Entry.any_instance.stub(:save).and_return(false)
        post :create, {:entry => { "title" => "invalid value" }}
        assigns(:entry).should be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        Entry.any_instance.stub(:save).and_return(false)
        post :create, {:entry => { "title" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested entry" do
        entry = FactoryGirl.create :entry
        Entry.any_instance.should_receive(:update).with({ "title" => "My Title" })
        put :update, {:id => entry.to_param, :entry => { "title" => "My Title" }}
      end

      it "assigns the requested entry as @entry" do
        entry = FactoryGirl.create :entry
        put :update, {:id => entry.to_param, :entry => valid_attributes}
        assigns(:entry).should eq(entry)
      end

      it "redirects to the entry" do
        entry = FactoryGirl.create :entry
        put :update, {:id => entry.to_param, :entry => valid_attributes}
        response.should redirect_to(entry)
      end
    end

    describe "with invalid params" do
      it "assigns the entry as @entry" do
        entry = FactoryGirl.create :entry
        Entry.any_instance.stub(:save).and_return(false)
        put :update, {:id => entry.to_param, :entry => { "title" => "invalid value" }}
        assigns(:entry).should eq(entry)
      end

      it "re-renders the 'edit' template" do
        entry = Entry.create! valid_attributes
        Entry.any_instance.stub(:save).and_return(false)
        put :update, {:id => entry.to_param, :entry => { "title" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested entry" do
      entry = FactoryGirl.create :entry
      expect {
        delete :destroy, {:id => entry.to_param}
      }.to change(Entry, :count).by(-1)
    end

    it "redirects to the entries list" do
      entry = Entry.create! valid_attributes
      delete :destroy, {:id => entry.to_param}
      response.should redirect_to(entries_url)
    end
  end
end
