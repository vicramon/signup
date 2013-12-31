class FieldsController < AuthenticatedController

  def create
    field = Field.create(field_params)
    redirect_to [field.form, :fields]
  end

  def destroy
    field = Field.find(params[:id])
    form = field.form
    redirect_to :dashboard unless current_user.owner?(field.form)
    field.destroy
    redirect_to [form, :fields]
  end

  private

  def field_params
    params.require(:field).permit(:form_id, :name, :required)
  end
end
