require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    let(:items) { create_list(:item, 5) }

    it 'gets accurate request' do
      get :index
      expect(response.status).to eq 200
    end

    it "populates an array of items ordered by created_at DESC" do
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.id <=> a.id })
    end

    it "populates an array of ledies_items " do
      ladies_items = items.search_with_root_id(1).first(4)
      get :index
      expect(assigns(:items)).to match(items)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
