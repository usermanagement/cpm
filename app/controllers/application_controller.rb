class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def set_company
    @company = current_user.company
    @company = Company.find('596372e5f1fee56f9a7ff107')
  end
end
