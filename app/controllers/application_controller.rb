class ApplicationController < ActionController::Base
def after_sign_in_path_for(resource)
  case resource
  when Admin
    admin_root_path
  when User
    user_user_path(resource)
  end
end

end
