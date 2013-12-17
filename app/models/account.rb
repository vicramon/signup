class Account < ActiveRecord::Base
  has_many :forms
  has_many :groups
end
