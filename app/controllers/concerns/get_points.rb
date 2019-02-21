module GetPoints
  private

  def total_point
    if user_signed_in?
      points = PointRecord.where(user_id: current_user.id).all
      @points = points.sum { |p| p[:point] }
    else
      @points = 0
    end
  end
end
