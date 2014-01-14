class User < ActiveRecord::Base
  extend RandomEmailCreator
  include Authem::User

  has_many :memberships
  has_many :accounts, through: :memberships
  has_many :forms, through: :accounts
  has_many :rsvps
  has_many :field_infos

  accepts_nested_attributes_for :field_infos, reject_if: proc { |attributes| attributes['info'].blank? }

  validates :email, uniqueness: true

  def self.create_temporary
    user = create(temporary: true,
      email: random_email,
      password: 'password',
      password_confirmation: 'password')
    account = Account.create(temporary: true)
    account.add_member(user)
    user
  end

  def self.create_rsvp_user
    user = create(rsvp: true,
      password: 'password',
      password_confirmation: 'password')
    account = Account.create(temporary: true)
    account.add_member(user)
    user
  end

  def owner?(form)
    forms.map(&:id).include? form.id
  end

end
