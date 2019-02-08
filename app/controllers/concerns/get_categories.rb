module GetCategories
  extend ActiveSupport::Concern

  private

  def get_root
    @parents = Category.roots
  end
end
