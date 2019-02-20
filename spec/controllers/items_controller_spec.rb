require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    before :each do
      5.times{ create(:item) }
      @items = Item.joins(:category).includes(:item_photos).order('id DESC')
    end

    it 'gets accurate request' do
      get :index
      expect(response.status).to eq 200
    end

    it "populates an array of @items ordered by created_at DESC" do
      get :index
      expect(assigns(:items)).to match(Item.joins(:category).includes(:item_photos).sort{ |a, b| b.id <=> a.id })
    end

    it "populates an array of @ladies_items" do
      get :index
      expect(assigns(:ladies_items)).to match(@items.where("ancestry LIKE ?", "1/%").first(4))
    end

    it "populates an array of @mens_items" do
      get :index
      expect(assigns(:mens_items)).to match(@items.where("ancestry LIKE ?", "2/%").first(4))
    end

    it "populates an array of @baby_items" do
      get :index
      expect(assigns(:baby_items)).to match(@items.where("ancestry LIKE ?", "3/%").first(4))
    end

    it "populates an array of @cosme_items" do
      get :index
      expect(assigns(:cosme_items)).to match(@items.where("ancestry LIKE ?", "7/%").first(4))
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before :each do
      @item = create(:item, category_id: 318)
      get :show, params: { id: @item }
    end

    it 'gets accurate request' do
      expect(response.status).to eq(200)
    end

    it "assigns the requested item to @item" do
      expect(assigns(:item)).to eq @item
    end

    it "assigns the requested grandchild category to @grandchild_category" do
      grandchild_category = Category.find(@item.category_id)
      expect(assigns(:grandchild_category)).to eq grandchild_category
    end

    it "assigns the requested child category to @child_category" do
      child_category = Category.ancestors_of(Category.find(@item.category_id)).last
      expect(assigns(:child_category)).to eq child_category
    end

    it "assigns the requested parent category to @parent_category" do
      parent_category = Category.ancestors_of(Category.find(@item.category_id)).first
      expect(assigns(:parent_category)).to eq parent_category
    end

    it "assigns the requested user's items to @users_item" do
      users_item = Item.where(user_id: @item.user_id).all
      expect(assigns(:users_item)).to eq users_item
    end

    it "assigns the requested item's previous item to @previous" do
      previous = Item.where('id < ?', @item.id).order('id DESC').first
      expect(assigns(:previous)).to eq previous
    end

    it "assigns the requested item's next item to @next_item" do
      next_item = Item.where('id < ?', @item.id).order('id DESC').last
      expect(assigns(:next_item)).to eq next_item
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe 'GET #search' do
    before :each do
      3.times{ create(:item, category_id: 58) }
      get :search
    end

    it 'gets accurate request' do
      expect(response.status).to eq(200)
    end

    it "renders the :search template" do
      expect(response).to render_template :search
    end

    it "assigns the requested items to @items" do
      keyword = "good"
      items = Item.where('items.name LIKE ? OR comment LIKE ?', "%#{keyword}%", "%#{keyword}%")
      expect(assigns(:items)).to match_array(items)
    end
  end

  describe 'Delete #destroy' do
    before :each do
      @user = create(:user)
      @item = create(:item, user_id: @user.id)
      login_user @user
    end

    it 'gets accurate request' do
      delete :destroy, params: {user_id: @item.user_id, id: @item.id}
      expect(response.status).to eq(302)
    end

    it 'deletes item intended to' do
      expect{
        delete :destroy, params: {user_id: @item.user_id, id: @item.id}
      }.to change(Item,:count).by(-1)
    end

    it 'redirects to the accurate request' do
      delete :destroy, params: {user_id: @item.user_id, id: @item.id}
      expect(response).to redirect_to onsale_user_items_path
    end
  end
end

