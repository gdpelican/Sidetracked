class EntriesController < ActionController::Base

  before_action :set_type
  before_action :load_entry, only: [:show, :edit, :update, :destroy]
  before_action :build_entry, only: [:new, :create]
  
  def index
    @entries = [Entry.new({ type: entry_type, title: "New #{@type}" })] + Entry.of_type(@type)
    @types = Entry.types - [:gig_entry] + [:gig]
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @entry.save
        format.html { redirect_to return_path, notice: "#{@type.humanize} successfully created." }
      else
        format.html { render action: :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update_attributes entry_params
        format.html { redirect_to return_path, notice: "#{@type.humanize} successfully updated." }
      else
        format.html { render action: :edit }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to return_path, notice: "#{@type.humanize} successfully deleted." }
    end
  end
  
  private
  
  def return_path
    send :"#{@type.pluralize}_url"
  end
  
  def load_entry
    @entry = Entry.find params[:id]
  end
  
  def build_entry
    @entry = Entry.new entry_params || { type: @type.humanize }
  end
  
  def entry_params
    params.require(@type).permit(:type, :title, :subtitle, :content, :picture) if params[@type]
  end
  
  def entry_type
    @type == 'gig' ? 'GigEntry' : @type.to_s.humanize
  end
  
  def set_type
    @type = params[:type].to_s.singularize
  end
  
end