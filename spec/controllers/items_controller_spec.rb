require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do

    it 'gets accurate request' do
      get :index
      expect(response.status).to eq 200
    end

    it "populates an array of @items ordered by created_at DESC" do
      5.times{ create(:item) }
      get :index
      expect(assigns(:items)).to match(Item.joins(:category).includes(:item_photos).sort{ |a, b| b.id <=> a.id })
    end
    #
    it "populates an array of @ladies_items" do
      5.times{ create(:item) }
      items = Item.joins(:category).includes(:item_photos).order('id DESC')
      get :index
      expect(assigns(:ladies_items)).to match(items.where("ancestry LIKE ?", "1/%").first(4))
    end

    it "populates an array of @mens_items" do
      5.times{ create(:item) }
      items = Item.joins(:category).includes(:item_photos).order('id DESC')
      get :index
      expect(assigns(:mens_items)).to match(items.where("ancestry LIKE ?", "2/%").first(4))
    end

    it "populates an array of @baby_items" do
      5.times{ create(:item) }
      items = Item.joins(:category).includes(:item_photos).order('id DESC')
      get :index
      expect(assigns(:baby_items)).to match(items.where("ancestry LIKE ?", "3/%").first(4))
    end

    it "populates an array of @cosme_items" do
      5.times{ create(:item) }
      items = Item.joins(:category).includes(:item_photos).order('id DESC')
      get :index
      expect(assigns(:cosme_items)).to match(items.where("ancestry LIKE ?", "7/%").first(4))
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
