class Form < ActiveRecord::Base
  belongs_to :account

  scope :published, -> { where(published: true) }
  scope :drafted, -> { where(published: false) }
end
