class FormMailer < ActionMailer::Base
  default from: 'no-reply@signupbuilder.com'

  def invite(invite)
    mail to: invite.email, subject: "Signup for #{invite.form.name}"
  end

end
