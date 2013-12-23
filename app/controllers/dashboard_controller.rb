class DashboardController < AuthenticatedController
  expose(:forms) { current_user.forms }
  expose(:published) { forms.published }
  expose(:drafts) { forms.drafted }
end
