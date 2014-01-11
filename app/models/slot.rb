class Slot < ActiveRecord::Base
  belongs_to :form
  has_many :rsvps

  scope :ordered, -> { order(:name) }

  def remaining; max - rsvps.count; end
  def full?; remaining <= 0; end
  def open?; remaining > 0; end
end
