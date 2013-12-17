class Group < ActiveRecord::Base
  has_many :contacts
  belongs_to :account
end
