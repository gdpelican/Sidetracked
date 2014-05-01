class SessionsController < ActionController::Base
  
  def create
    session[:admin] = Admin.hex if params[:password] == ENV['ADMIN_PASSWORD']
    render json: session[:admin].present?
  end
  
  def destroy
    session[:admin] = nil
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Successfully logged out" }
      format.json { render json: true }
    end
  end
  
end