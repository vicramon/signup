class User < ActiveRecord::Base
  extend RandomEmailCreator
  include Authem::User

  has_many :memberships
  has_many :accounts, through: :memberships
  has_many :forms, through: :accounts

  validates :email, uniqueness: true

  def self.create_temporary
    user = create(temporary: true,
           email: random_email,
           password: 'temp',
           password_confirmation: 'temp')
    account = Account.create(temporary: true)
    account.add_member(user)
    user
  end

  def has_access?(form)
    forms.map(&:id).include? form.id
  end

end
