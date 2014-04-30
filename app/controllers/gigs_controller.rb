class GigsController < AdminController

  def create
    @gig = Gig.new gig_params
    respond_to do |format|
      if @gig.save
        format.html { redirect_to gigs_url, notice: "Gig successfully created." }
      else
        format.html { render action: 'entries/new' }
      end
    end
  end

  def update
    @gig = Gig.find params[:id]
    respond_to do |format|
      if @gig.update_attributes gig_params
        format.html { redirect_to gigs_url, notice: "Gig successfully updated." }
      else
        format.html { render action: 'entries/edit' }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @gig = Gig.find_by_entry params[:id]
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: "Gig successfully deleted." }
    end
  end
  
  private
  
  def gig_params
    params.require(:gig).permit(:name, :city, :state, :act_id, :description, :picture, :link, :dates)
  end
  
end