class User < ActiveRecord::Base
  extend RandomEmailCreator
  include Authem::User

  def self.create_temporary
    create(temporary: true,
           email: random_email,
           password: 'temp',
           password_confirmation: 'temp')
  end

  def signups
  end

end
