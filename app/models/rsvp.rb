class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :form
  belongs_to :slot
  has_many :field_infos

  def info_for_field(field)
    field_info = field_infos.where(field: field).first
    field_info.info if field_info
  end

end
