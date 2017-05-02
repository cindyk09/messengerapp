class RegistrationsController < ApplicationController

  protected
    # Redirecting sign_up path
  def after_sign_in_path_for(resource_or_scope)
    current_user
  end

  def after_update_path_for(resource)
   current_user
  end
end
