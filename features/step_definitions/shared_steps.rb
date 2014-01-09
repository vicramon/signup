def create_user_with_account
  @user = Fabricate(:user)
  @account = Fabricate(:account)
  @account.add_member(@user)
end
