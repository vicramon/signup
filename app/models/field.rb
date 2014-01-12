class Field < ActiveRecord::Base
  belongs_to :form
  has_many :field_infos
end
