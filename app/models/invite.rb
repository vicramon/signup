class Invite < ActiveRecord::Base
  belongs_to :form
  scope :ordered, -> { order(:email) }
end
