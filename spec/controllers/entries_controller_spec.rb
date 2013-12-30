require 'spec_helper'

describe EntriesController do

  describe "GET show" do
    it "returns the requested entry" do
      entry = FactoryGirl.create :entry
      get :show, {:id => entry.to_param}

      expect(response).to be_success
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Entry" do
        expect {
          post :create, {entry: {title: 'My new title', body: 'new body for testing'}}
        }.to change(Entry, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "doesn't create a new entry" do
        Entry.any_instance.stub(:save).and_return(false)
        post :create, {entry: { title: 'missing body' }}
        expect(response).to be_success
      end
    end
  end
end
