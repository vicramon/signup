class SlotsController < AuthenticatedController

  def destroy
    slot = Slot.find(params[:id])
    redirect_to :dashboard unless current_user.owner?(slot.form)
    form = slot.form
    slot.destroy
    redirect_to [form, :slots]
  end

end
