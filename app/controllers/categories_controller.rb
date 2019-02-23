class CategoriesController < ApplicationController
  include GetCategories
  before_action :authenticate_user!, except: [:index]
  before_action :get_root

  def index
  end
end
