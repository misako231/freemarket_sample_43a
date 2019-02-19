module ApplicationHelper
  def get_child_from_root(root)
    if root.present?
      Category.children_of(root).all
    else
      return []
    end
  end

  def get_deeper_from_child(child)
    Category.where("ancestry LIKE ?", "%/#{child.id}").all
  end

  def get_deeper_from_childId(child_id)
    Category.where("ancestry LIKE ?", "%/#{child_id}").all
  end

end
