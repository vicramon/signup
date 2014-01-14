class SignupsController < ApplicationController
  before_filter :ensure_published
  expose(:form, finder: :find_by_id)
  expose(:slot) { form.slots.find_by_id(params[:slot_id]) }

  def ensure_published
    redirect_to :root if form.nil? or form.unpublished?
  end

  def new
    @user = User.new
    @rsvp = User.new.rsvps.build
    form.fields.each do |field|
      @user.field_infos.build(field_id: field.id)
    end
  end

  def create
    slot = Slot.find_by_id(params[:slot_id])
    form = Form.find(params[:form_id])
    if already_signed_up?
      flash[:error] = "You appear to have already signed up for this event."
    else
      if slot
        slot_signup
      else
        general_signup
      end
    end
    redirect_to signup_path(form)
  end

  private

  def already_signed_up?
    form.rsvped_users.map(&:email).include? params[:user][:email]
  end

  def general_signup
    user = get_or_create_rsvp_user
    rsvp = create_rsvp(user, form, nil)
    flash[:notice] = "You've successfully signed up!"
  end

  def slot_signup
    if slot.open?
      user = get_or_create_rsvp_user
      rsvp = create_rsvp(user, form, slot)
      flash[:notice] = "You've successfully signed up!"
    else
      flash[:error] = "Sorry, but that slot is now full."
    end
  end

  def create_rsvp(user, form, slot)
    rsvp = user.rsvps.create(form: form, slot: slot)
    user.field_infos.where(rsvp_id: nil).update_all(rsvp_id: rsvp.id)
  end

  def get_or_create_rsvp_user
    existing_user = User.find_by_email(params[:user][:email])
    user = existing_user || User.create_rsvp_user
    user.update_attributes(user_params)
    user
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      field_infos_attributes: [:id, :info, :field_id])
  end

end
