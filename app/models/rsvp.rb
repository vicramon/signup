class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :form
  belongs_to :slot
  has_many :field_infos
end
