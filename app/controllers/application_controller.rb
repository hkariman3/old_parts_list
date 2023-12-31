class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_path
    else
        posts_path
    end

  end

end