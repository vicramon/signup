class SignupsController < ApplicationController
  before_filter :ensure_published
  expose(:form, finder: :find_by_id)
  expose(:slot, finder: :find_by_id)

  def ensure_published
    redirect_to :root if form.nil? or form.unpublished?
  end

  def new
    @user = User.new
    @rsvp = User.new.rsvps.build
  end

  def create
    slot = Slot.find_by_id(params[:slot_id])
    form = Form.find(params[:form_id])
    if slot
      slot_signup
    else
      general_signup
    end
    redirect_to signup_path(form)
  end

  private

  def general_signup
    user = get_or_create_rsvp_user
    create_rsvp(user, form, nil)
    flash[:notice] = "You've successfully signed up!"
  end

  def slot_signup
    if slot.open?
      user = get_or_create_rsvp_user
      create_rsvp(user, form, slot)
      flash[:notice] = "You've successfully signed up!"
    else
      flash[:error] = "Sorry, but that slot is now full."
    end
  end

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
