class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        root_path
    else
        customer_path(current_customer.id)
    end

  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end
  
  private
  def show_message
    flash[:notice] = "ログインが必要です" if request.path != new_customer_session_path
  end
end