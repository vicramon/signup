namespace :db do
  task populate: :environment do
    [User, Form, Account, Membership, Contact, Field, Group].each do |model|
      model.delete_all
    end

    account = Fabricate(:account)
    user = Fabricate(:user, name: 'Vic Ramon', email: 'vic@vicramon.com')
    account.add_member(user)

    Fabricate(:form, account: account)
    Fabricate(:form, account: account, published: true)

  end
end
