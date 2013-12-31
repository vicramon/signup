class SlotsController < AuthenticatedController

  def create
    slot = Slot.create(slot_params)
    redirect_to [slot.form, :slots]
  end

  def destroy
    slot = Slot.find(params[:id])
    redirect_to :dashboard unless current_user.owner?(slot.form)
    form = slot.form
    slot.destroy
    redirect_to [form, :slots]
  end

  private

  def slot_params
    params.require(:slot).permit(:form_id, :name, :max)
  end

end
