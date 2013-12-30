class FieldsController < AuthenticatedController

  def create
    field = Field.create(field_params)
    redirect_to [field.form, :fields]
  end

  def field_params
    params.require(:field).permit(:form_id, :name, :required)
  end
end
