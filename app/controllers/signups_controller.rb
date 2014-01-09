class SignupsController < ApplicationController
  expose(:form)
  expose(:slot)

  def new
    @user = User.new
    @rsvp = User.new.rsvps.build
  end

  def create
    slot = Slot.find(params[:slot_id])
    form = Form.find(params[:form_id])
    if slot.open?
      user = get_or_create_rsvp_user
      create_rsvp(user, form, slot)
      flash[:notice] = "You've successfully signed up!"
    else
      flash[:error] = "Sorry, but that slot is now full."
    end
    redirect_to signup_path(form)
  end

  private

  def create_rsvp(user, form, slot)
    user.rsvps.create(form: form, slot: slot)
  end

  def get_or_create_rsvp_user
    existing_user = User.find_by_email(params[:user][:email])
    if existing_user
      existing_user
    else
      user = User.create_rsvp_user
      user.update_attributes(user_params)
      user
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
