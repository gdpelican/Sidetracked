class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
    
  def index
    DataService.methods(false).each { |method| instance_variable_set :"@#{method}", DataService.send(method) }

    respond_to do |format|
      format.html
    end
  
  end
  
end
