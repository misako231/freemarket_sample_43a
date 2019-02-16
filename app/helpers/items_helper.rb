module ItemsHelper
  def use_point(point, price)
    point.to_i >= price.to_i ? price : point
  end
end
