class Invite < ActiveRecord::Base
  belongs_to :form
  scope :ordered, -> { order(:email) }

  def send!
    unless self.sent?
      FormMailer.invite(self).deliver
      update_attribute(:sent, true)
    end
  end

  def unsent?
    !self.sent
  end

end
