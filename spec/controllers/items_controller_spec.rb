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
  end


end



