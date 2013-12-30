require 'spec_helper'

def create_user_with_form
  @user = Fabricate(:user)
  @account = Fabricate(:account)
  @account.add_member(@user)
  @form = Fabricate(:form, account: @account)
end

describe User do

  describe '.create_temporary' do
    it 'creates a temporary user' do
      user = User.create_temporary
      user.should be_instance_of(User)
      user.should be_valid
      user.temporary.should be_true
    end
  end

  describe '#has_access?' do
    it 'returns true if form belongs to user' do
      create_user_with_form
      @user.has_access?(@form).should be true
    end

    it 'returns false if form does not belong to user' do
      create_user_with_form
      other_form = Fabricate(:form)
      @user.has_access?(other_form).should be false
    end
  end

end
