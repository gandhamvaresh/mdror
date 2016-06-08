class ChiropracticModalitiesListsController < ApplicationController
  before_filter :load_chiropractic_treatment

  # GET /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_modalities_list(.:format) 
  def show
    @chiropractic_modalities_list = @chiropractic_treament.chiropractic_modalities_list
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_modalities_list }
    end
  end

  # GET /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_modalities_list/new(.:format)
  def new
    @chiropractic_modalities_list = @chiropractic_treament.build_chiropractic_modalities_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chiropractic_modalities_list }
    end
  end

  # GET /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_modalities_list/edit(.:format)
  def edit
    @chiropractic_modalities_list = @chiropractic_treament.chiropractic_modalities_list
  end

  # POST /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_modalities_list(.:format)
  def create
    @chiropractic_modalities_list = @chiropractic_treament.build_chiropractic_modalities_list(params[:chiropractic_modalities_list])

    respond_to do |format|
      if @chiropractic_modalities_list.save
        format.html { redirect_to chiropractic_treatment_chiropractic_modalities_list_path(@chiropractic_treament), notice: 'Chiropractic modalities list was successfully created.' }
        format.json { render json: @chiropractic_modalities_list, status: :created, location: @chiropractic_modalities_list }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_modalities_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_modalities_list(.:format)
  def update
    @chiropractic_modalities_list = @chiropractic_treament.chiropractic_modalities_list

    respond_to do |format|
      if @chiropractic_modalities_list.update_attributes(params[:chiropractic_modalities_list])
        format.html { redirect_to chiropractic_treatment_chiropractic_modalities_list_path(@chiropractic_treament), notice: 'Chiropractic modalities list was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_modalities_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_modalities_list(.:format)
  def destroy
    @chiropractic_modalities_list = @chiropractic_treament.chiropractic_modalities_list
    @chiropractic_modalities_list.destroy

    respond_to do |format|
      format.html { redirect_to chiropractic_treatment_path(@chiropractic_treatment) }
      format.json { head :ok }
    end
  end
  
  private
  
  def load_chiropractic_treatment
    @chiropractic_treament = ChiropracticTreatment.where(:id => params[:chiropractic_treatment_id])
  end
end
