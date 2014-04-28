class GigsController < ActionController::Base

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @gig.save
        format.html { redirect_to return_path, notice: "#{@type.humanize} successfully created." }
      else
        format.html { render action: :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @gig.update_attributes gig_params
        format.html { redirect_to return_path, notice: "#{@type.humanize} successfully updated." }
      else
        format.html { render action: :edit }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to return_path, notice: "#{@type.humanize} successfully deleted." }
    end
  end
  
end