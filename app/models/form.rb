class Form < ActiveRecord::Base
  belongs_to :account
  has_many :slots
  accepts_nested_attributes_for :slots

  scope :published, -> { where(published: true) }
  scope :drafted, -> { where(published: false) }
end
