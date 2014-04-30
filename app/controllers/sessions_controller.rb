class SessionsController < ActionController::Base
  
  def create
    session[:admin] = true if params[:password] == 'TEMP'
    render json: session[:admin]
  end
  
  def destroy
    session[:admin] = nil
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Successfully logged out" }
      format.json { render json: true }
    end
  end
  
end