require 'rails_helper'

describe ItemsController do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #create' do
    it "assigns the requested create to @create" do
    end

    it "renders the :create template" do
      get :create
      expect(response).to render_template :create
    end

    subject {post :create, params: params}
    let(:params){{item_id: item.id, item: attributes_for(:item)}}

    it "count up item" do
      expect{subject}.to change(Item, :count).by(1)
    end
  end

end



