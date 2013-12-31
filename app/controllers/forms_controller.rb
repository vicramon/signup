class FormsController < ApplicationController
  before_filter :create_temporary_if_no_user
  expose(:forms) { current_user.forms }
  expose(:form) { new_or_find_form }

  def new_or_find_form
    id = params[:form_id] || params[:id]
    id ? forms.find(id) : Form.new
  end

  def new; redirect_to basic_info_forms_path; end
  def edit; redirect_to [form, :basic_info]; end

  def create
    form = Form.create(form_params)
    form.account = current_user.accounts.first
    form.save
    redirect_to [form, :slots]
  end

  def update
    form.update_attributes(form_params)
    redirect_to [form, :slots]
  end

  def slots
    @max_options = [['unlimited',0]].concat((1..50).to_a)
  end

  def update_slots
    form.update_attributes(form_params)
    redirect_to [form, :fields]
  end

  def fields
    @required_options = [['no', false], ['yes', true]]
  end

  def update_fields
    form.update_attributes(form_params)
    redirect_to [form, :people]
  end

  private

  def create_temporary_if_no_user
    sign_in(User.create_temporary) unless current_user
  end

  def current_signup
    sessions[:current_form]
  end

  def form_params
    params.require(:form).permit(
      :name,
      :description,
      :starts_at,
      :ends_at,
      :date,
      :send_reminders,
      :reminder_days_before,
      :notify_admin_of_new_signup,
      :published,
      slots_attributes: [:id, :name, :max],
      fields_attributes: [:id, :name, :required]
    )
  end

end
