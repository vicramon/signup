class FieldInfo < ActiveRecord::Base
  belongs_to :field
  belongs_to :rsvp
end
