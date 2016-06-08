class ChiropracticBodyAdjustmentListsController < ApplicationController
   before_filter :load_chiropractic_treatment
   
  # GET /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_body_adjustment_list(.:format)
  def show
    @chiropractic_body_adjustment_list = @chiropractic_treament.chiropractic_body_adjustment_list

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_body_adjustment_list }
    end
  end

  # GET /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_body_adjustment_list/new(.:format)
  def new
    @chiropractic_body_adjustment_list = @chiropractic_treament.build_chiropractic_body_adjustment_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chiropractic_body_adjustment_list }
    end
  end

  # GET /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_body_adjustment_list/edit(.:format)
  def edit
    @chiropractic_body_adjustment_list = @chiropractic_treament.chiropractic_body_adjustment_list
  end

  # POST /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_body_adjustment_list(.:format)
  def create
    @chiropractic_body_adjustment_list = @chiropractic_treament.build_chiropractic_body_adjustment_list(params[:chiropractic_body_adjustment_list])

    respond_to do |format|
      if @chiropractic_body_adjustment_list.save
        format.html { redirect_to chiropractic_treatment_chiropractic_body_adjustment_list_path(@chiropractic_treament), notice: 'Chiropractic body adjustment list was successfully created.' }
        format.json { render json: @chiropractic_body_adjustment_list, status: :created, location: @chiropractic_body_adjustment_list }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_body_adjustment_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chiropractic_treatments/:chiropractic_treatment_id/chiropractic_body_adjustment_list(.:format)
  def update
    @chiropractic_body_adjustment_list = @chiropractic_treament.chiropractic_body_adjustment_list

    respond_to do |format|
      if @chiropractic_body_adjustment_list.update_attributes(params[:chiropractic_body_adjustment_list])
        format.html { redirect_to chiropractic_treatment_chiropractic_body_adjustment_list_path(@chiropractic_treament), notice: 'Chiropractic body adjustment list was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_body_adjustment_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chiropractic_body_adjustment_lists/1
  # DELETE /chiropractic_body_adjustment_lists/1.json
  def destroy
    @chiropractic_body_adjustment_list = @chiropractic_treament.chiropractic_body_adjustment_list
    @chiropractic_body_adjustment_list.destroy

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
