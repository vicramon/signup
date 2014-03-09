class Slot < ActiveRecord::Base
  belongs_to :form
  has_many :rsvps

  scope :ordered, -> { order(:name) }

  def remaining
    max - rsvps.count
  end

  def pretty_remaining
    unlimited?? 'unlimited' : remaining
  end

  def full?
    remaining <= 0 && !unlimited?
  end

  def open?
    remaining > 0 || unlimited?
  end

  def unlimited?
    max == 0
  end

end
