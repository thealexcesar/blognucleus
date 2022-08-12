class ApplicationController < ActionController::Base

  protected
  def require_user
    if signed_in?
      true
    else
      redirect_to root_path, alert: I18n.t('general.error_message.denied')
      return false
    end
  end
  #=====================================================================================================================
  def admin?
    if current_user.user_type == "admin"
      true
    else
      redirect_to root_path, alert: I18n.t('general.error_message.denied')
      return false
    end
  end
end
