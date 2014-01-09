class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :form
  belongs_to :slot
end
