class PointRecord < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :order_status, optional: true

  before_save :used_point

  private

  def used_point
    point = self.point
    point = point*(-1)
    self.point = point
  end
end
