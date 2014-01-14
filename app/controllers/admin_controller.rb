class AdminController < AuthenticatedController
  expose(:forms, ancestor: :current_user)
  expose(:form)
end
