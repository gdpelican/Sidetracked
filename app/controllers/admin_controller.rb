class AdminController < ActionController::Base
  before_action :prompt_for_credentials, only: [:new, :edit, :index], unless: :admin?
  before_action :require_credentials!, only: [:create, :update, :destroy], unless: :admin?
  
  private 
  
  def admin?
    session[:admin] == Admin.hex
  end
  
  def prompt_for_credentials
    @prompt_for_admin = true
  end
  
  def require_credentials!
    redirect_to root_url, notice: "Only admins may complete this action."
  end
  
end