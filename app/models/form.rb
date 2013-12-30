class Form < ActiveRecord::Base
  belongs_to :account
  has_many :slots
  has_many :fields
  accepts_nested_attributes_for :slots, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :fields, reject_if: proc { |attributes| attributes['name'].blank? }


  scope :published, -> { where(published: true) }
  scope :drafted, -> { where(published: false) }
end
