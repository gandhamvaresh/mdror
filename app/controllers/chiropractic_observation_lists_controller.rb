class ChiropracticObservationListsController < ApplicationController
  before_filter :load_chiropractic_treatment
  
  # GET /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_observation_list(.:format)
  def show
    @chiropractic_observation_list = @chiropractic_treament.chiropractic_observation_list 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_observation_list }
    end
  end

  # GET /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_observation_list/new(.:format) 
  def new
    @chiropractic_observation_list = @chiropractic_treament.build_chiropractic_observation_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chiropractic_observation_list }
    end
  end

  # GET /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_observation_list/edit(.:format)
  def edit
    @chiropractic_observation_list = @chiropractic_treament.chiropractic_observation_list
  end

  # POST /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_observation_list(.:format)
  def create
    @chiropractic_observation_list = @chiropractic_treament.build_chiropractic_observation_list(params[:chiropractic_observation_list])

    respond_to do |format|
      if @chiropractic_observation_list.save
        format.html { redirect_to chiropractic_treatment_chiropractic_observation_list_path(@chiropractic_treatment), notice: 'Chiropractic observation list was successfully created.' }
        format.json { render json: @chiropractic_observation_list, status: :created, location: @chiropractic_observation_list }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_observation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_observation_list(.:format)
  def update
    @chiropractic_observation_list = @chiropractic_treament.chiropractic_observation_list

    respond_to do |format|
      if @chiropractic_observation_list.update_attributes(params[:chiropractic_observation_list])
        format.html { redirect_to chiropractic_treatment_chiropractic_observation_list_path(@chiropractic_treatment), notice: 'Chiropractic observation list was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_observation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_observation_list(.:format)
  def destroy
    @chiropractic_observation_list = @chiropractic_treament.chiropractic_observation_list
    @chiropractic_observation_list.destroy

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
