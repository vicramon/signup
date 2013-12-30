class SlotsController < ApplicationController

  def destroy
    slot = Slot.find(params[:id])
    redirect_to :dashboard unless owner?(slot)
    form = slot.form
    slot.destroy
    redirect_to [form, :slots]
  end

  def owner?(slot)
    current_user.has_access?(slot.form)
  end

end
