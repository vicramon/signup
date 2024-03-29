class Form < ActiveRecord::Base
  belongs_to :account
  has_many :slots
  has_many :fields
  has_many :invites
  has_many :rsvps
  accepts_nested_attributes_for :slots, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :fields, reject_if: proc { |attributes| attributes['name'].blank? }

  scope :published, -> { where(published: true) }
  scope :drafted, -> { where(published: false) }

  attr_accessor :continue

  def ordered_slots; slots.ordered; end

  def set_default_invite_text
    self.invite_text = "You've been invited to #{self.name}.\n\nYou can signup by clicking the link below"
    save
  end

  def has_when?
    self.date.present? or
      self.starts_at.present? or
      self.ends_at.present?
  end

  def pretty_date
    self.date.strftime("%A, %B %e, %Y")
  end

  def when
    output = ''
    output += "From #{pretty_time(starts_at)} to #{pretty_time(ends_at)} " if starts_at and ends_at
    output += "\non #{pretty_date}" if date
    output
  end

  def pretty_time(time)
    time.strftime("%l:%M%P")
  end

  def publish!
    update_attribute(:published, true)
  end

  def draft?; !published; end
  alias unpublished? draft?

  def unsent_invites
    invites.select { |invite| invite.unsent? }
  end

  def has_unsent_invites?; unsent_invites.any?; end

  def rsvped_users
    rsvps.map(&:user)
  end

end
