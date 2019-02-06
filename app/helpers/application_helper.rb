module ApplicationHelper
  def get_child_from_root(root)
    Category.children_of(root).all
  end

  def get_deeper_from_child(child)
    Category.where("ancestry LIKE ?", "%/#{child.id}").all
  end
end
