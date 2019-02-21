class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :get_size_group
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_ransack_q
  protect_from_forgery with: :exception #セキュリティ対策

  def search
    if params[:root_id].present?
      render json: Category.where(ancestry: params[:root_id])
    elsif params[:child_id].present?
      render json: Category.where("ancestry LIKE ?", "%/#{params[:child_id]}")
    elsif params[:q].present?
      edit_params_for_search(params)
      @q = Item.ransack(params[:q])
      @items = @q.result(distinct: true).includes(:item_photos).page(params[:page]).per(NUM_PER_PAGE)
    elsif params[:size_group].present?
      render json: get_size_group(params[:size_group])
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone, :paying_way, :birth_y, :birth_m, :birth_d, :nickname, :comment, :avatar, :postal_code, :prefecture, :city, :block, :building, :uid, :provider, :oauth_token])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone, :paying_way, :birth_y, :birth_m, :birth_d, :nickname, :comment, :avatar, :postal_code, :prefecture, :city, :block, :building, :uid, :provider, :oauth_token])
  end

  private

  def production?
    Rails.env.production?
  end

  def set_ransack_q
     @q = Item.ransack(params[:q])
  end

  def edit_params_for_search(params)
    @search_keyword = params[:q][:name_cont_all]
    @search_brand = params[:q][:brand_name_eq]
    @selected_parent_category = params[:q][:category_ancestry_start]
    @selected_child_category = params[:q][:category_ancestry_cont]
    @checked_categories = params[:q][:category_ancestry_end_any]
    @selected_size_group = params[:size_group]
    @checked_size = params[:q][:category_name_eq_any]
    params[:q][:name_cont_all] = params[:q][:name_cont_all].split(/[\p{blank}\s]+/) if params[:q][:name_cont_all].present?
    params[:q][:category_ancestry_start] = params[:q][:category_ancestry_start] + "/" if params[:q][:category_ancestry_start].present?
    params[:q][:category_ancestry_cont] = '/' + params[:q][:category_ancestry_cont] + '/' if params[:q][:category_ancestry_cont].present?
    params[:q][:category_ancestry_end_any] = params[:q][:category_ancestry_end_any].map{|c| '/' + c} if params[:q][:category_ancestry_end_any].present?
    return params, @search_keyword, @search_brand, @selected_parent_category, @selected_parent_category, @selected_child_category, @checked_categories, @checked_size_group
  end

  def get_size_group(num)
    case num
    when '1'  then Category::CLOTH_SIZE
    when '2'  then Category::MENS_SHOES_SIZE
    when '3'  then Category::LADIES_SHOES_SIZE
    when '4'  then Category::SKIRT_SIZE
    when '5'  then Category::KIDS_CLOTH_SIZE
    when '6'  then Category::BABY_SHOES_SIZE
    when '7'  then Category::BABY_CLOTH_SIZE
    when '8'  then Category::TV_SIZE
    when '9'  then Category::LENS_SIZE
    when '10' then Category::AUTOBIKE_SIZE
    when '11' then Category::HELMET_SIZE
    when '12' then Category::TIRE_SIZE
    when '13' then Category::SKI_SIZE
    when '14' then Category::SNOWBOARD_SIZE
    end
  end

  def basic_auth # Basic認証
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
