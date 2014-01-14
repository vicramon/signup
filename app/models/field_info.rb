class FieldInfo < ActiveRecord::Base
  belongs_to :field
  belongs_to :rsvp
  belongs_to :user
end
