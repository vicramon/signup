require 'spec_helper'

describe User do

  describe '.create_temporary' do
    it' creates a temporary user' do
      user = User.create_temporary
      user.should be_instance_of(User)
      user.should be_valid
      user.temporary.should be_true
    end
  end

end
