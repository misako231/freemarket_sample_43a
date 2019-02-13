module GetPoints
  private

  def total_point
    points = PointRecord.where(user_id: current_user.id).all
    @points = points.sum { |p| p[:point] }
  end
end
