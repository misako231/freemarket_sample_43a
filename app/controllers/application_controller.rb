class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  protect_from_forgery with: :exception #セキュリティ対策

  def search
    if params[:root_id].present?
      @search_children = Category.where(ancestry: params[:root_id])
      render json: @search_children
    elsif params[:child_id].present?
      @search_grand_children = Category.where("ancestry LIKE ?", "%/#{params[:child_id]}")
      render json: @search_grand_children
    else
      edit_params_for_search(params)
      @q = Item.ransack(params[:q])
      @items = @q.result(distinct: true).includes(:item_photos).page(params[:page]).per(NUM_PER_PAGE)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone, :paying_way, :birth_y, :birth_m, :birth_d, :nickname, :comment, :avatar, :postal_code, :prefecture, :city, :block, :building, :uid, :provider, :oauth_token])
  end


  private

  def production?
    Rails.env.production?
  end

  def set_search
     @q = Item.ransack(params[:q])
  end

  def edit_params_for_search(params)
    @search_keyword = params[:q][:name_cont_all]
    @search_brand = params[:q][:brand_name_eq]
    @selected_parent_category = params[:q][:category_ancestry_start]
    @selected_child_category = params[:q][:category_ancestry_cont]
    @checked_categories = params[:q][:category_ancestry_end_any]
    params[:q][:name_cont_all] = params[:q][:name_cont_all].split(/[\p{blank}\s]+/) if params[:q][:name_cont_all].present?
    params[:q][:category_ancestry_start] = params[:q][:category_ancestry_start] + "/" if params[:q][:category_ancestry_start].present?
    params[:q][:category_ancestry_cont] = '/' + params[:q][:category_ancestry_cont] + '/' if params[:q][:category_ancestry_cont].present?
    params[:q][:category_ancestry_end_any] = params[:q][:category_ancestry_end_any].map{|c| '/' + c} if params[:q][:category_ancestry_end_any].present?
    return params, @search_keyword, @search_brand, @selected_parent_category, @selected_parent_category, @selected_child_category, @checked_categories
  end

  def basic_auth # Basic認証
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
