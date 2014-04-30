class AdminController < ActionController::Base
  before_action :prompt_for_credentials, only: [:new, :edit, :index]
  before_action :require_credentials!, only: [:create, :update, :destroy]
  
  private 
  
  def prompt_for_credentials
    @prompt_for_admin = true unless session[:admin]
  end
  
  def require_credentials!
    redirect_to root_url, notice: "Only admins may complete this action." unless session[:admin]
  end
  
end