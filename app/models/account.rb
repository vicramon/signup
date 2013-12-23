class Account < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :forms, dependent: :destroy

   def add_member(user)
     self.memberships.create(user: user)
   end

end
