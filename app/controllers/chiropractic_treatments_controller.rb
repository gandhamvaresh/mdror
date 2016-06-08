class ChiropracticTreatmentsController < ApplicationController
  before_filter :login_required
  before_filter :load_client_patient_accident_and_chiropractic_examination
  before_filter :check_for_mobile
  
  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:chiropractic_examination_id/chiropractic_treatments(.:format)
  def index
    @chiropractic_treatments = @chiropractic_examination.chiropractic_treatments.not_deleted.order('completed', 'insurance_claim_filed').page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chiropractic_treatments }
    end
  end

  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:chiropractic_examination_id/chiropractic_treatments/:id(.:format)
  def show
    @chiropractic_treatment = @chiropractic_examination.chiropractic_treatments.find(params[:id])  
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_treatment }
    end
  end

  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:chiropractic_examination_id/chiropractic_treatments/:id/print_friendly(.:format)
  def print_friendly
    @chiropractic_treatment = @chiropractic_examination.chiropractic_treatments.find(params[:id])  
    
    respond_to do |format|
      format.html { render :layout => 'no_header_footer' }
      format.json { render json: @chiropractic_treatment }
    end
  end
  
  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:chiropractic_examination_id/chiropractic_treatments/new(.:format)
  def new
    if @chiropractic_examination.chiropractic_treatments.blank?  
      @chiropractic_treatment = @chiropractic_examination.chiropractic_treatments.build(:client_id => @client.id)
      @chiropractic_treatment.build_chiropractic_observation_list
      @chiropractic_treatment.build_chiropractic_body_adjustment_list
      @chiropractic_treatment.build_chiropractic_modalities_list
    else
      most_recent_treatment = @chiropractic_examination.chiropractic_treatments.last
      @chiropractic_treatment = @chiropractic_examination.chiropractic_treatments.build(:client_id => @client.id)
      @chiropractic_treatment.build_chiropractic_observation_list(most_recent_treatment.chiropractic_observation_list.attributes)
      @chiropractic_treatment.build_chiropractic_body_adjustment_list(most_recent_treatment.chiropractic_body_adjustment_list.attributes)
      @chiropractic_treatment.build_chiropractic_modalities_list(most_recent_treatment.chiropractic_modalities_list.attributes)
    end
    
    @chiropractic_treatment.save!
    
    respond_to do |format|
      format.html { redirect_to edit_patient_accident_chiropractic_examination_chiropractic_treatment_path(@patient, @accident, @chiropractic_examination, @chiropractic_treatment) }
      format.json { render json: @chiropractic_treatment }
    end
  end

  # POST /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:chiropractic_examination_id/chiropractic_treatments(.:format)
  def create
    @chiropractic_treatment = @chiropractic_examination.chiropractic_treatments.build(params[:chiropractic_treatment])

    respond_to do |format|
      if @chiropractic_treatment.save
        format.html { redirect_to patient_accident_chiropractic_examination_chiropractic_treatment_path(@patient, @accident, @chiropractic_examination, @chiropractic_treatment), notice: 'Chiropractic treatment was successfully created.' }
        format.json { render json: @chiropractic_treatment, status: :created, location: @chiropractic_treatment }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_treatment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:chiropractic_examination_id/chiropractic_treatments/:id/edit(.:format)
  def edit
    @chiropractic_treatment = @chiropractic_examination.chiropractic_treatments.find(params[:id])
  end

  # PUT /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:chiropractic_examination_id/chiropractic_treatments/:id(.:format) 
  def update
    @chiropractic_treatment = @chiropractic_examination.chiropractic_treatments.find(params[:id])
    form_completed_earlier = @chiropractic_treatment.completed?
    
    if params[:back_button]
      @chiropractic_treatment.previous_step
    else
      @chiropractic_treatment.next_step
    end
    
    respond_to do |format|
      if @chiropractic_treatment.update_attributes(params[:chiropractic_treatment])
        if !form_completed_earlier && @chiropractic_treatment.completed?
          @chiropractic_treatment.completed_at = Time.now
          @chiropractic_treatment.completed_by = current_user.id
          @chiropractic_treatment.save!
        end
        
        format.html { 
          if params[:done_button]
            redirect_to patient_accident_chiropractic_examination_chiropractic_treatment_path(@patient, @accident, @chiropractic_examination, @chiropractic_treatment), notice: 'Chiropractic treatment was successfully updated.'
          else
            render action: "edit"
          end
        }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:chiropractic_examination_id/chiropractic_treatments/:id(.:format)
  def destroy
    @chiropractic_treatment = ChiropracticTreatment.find(params[:id])
    
    if @chiropractic_treatment.deleted_at.blank?
      @chiropractic_treatment.destroy
    else
      @chiropractic_treatment.revive
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
  
  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:chiropractic_examination_id/chiropractic_treatments/:id/insurance_claim_processed(.:format)
  
  def insurance_claim_processed
    @chiropractic_treatment = @chiropractic_examination.chiropractic_treatments.find(params[:id])
    @chiropractic_treatment.insurance_claim_filed = true
    @chiropractic_treatment.insurance_claim_filed_at = Time.now
    @chiropractic_treatment.insurance_claim_filed_by = current_user.id
    @chiropractic_treatment.save!
    
    respond_to do |format|
      format.html { redirect_to patient_accident_chiropractic_examination_chiropractic_treatment_path(@patient, @accident, @chiropractic_examination, @chiropractic_treatment), notice: 'Chiropractic treatment was successfully marked as submitted for medical insurance claim.' }
      format.json { head :ok }
    end
  end
  
  private
  
  def load_client_patient_accident_and_chiropractic_examination
    if current_user.admin? || current_user.staff?
      session[:current_tab] = 'Clients' unless session[:current_tab] == 'Archives'
      @client = Patient.find(params[:patient_id]).client
    else
      session[:current_tab] = 'Patients' unless session[:current_tab] == 'Archives'
      @client = Client.find(current_user.client_id)
    end
    
    @patient = @client.patients.find(params[:patient_id])
    @accident = @patient.accidents.find(params[:accident_id])
    @chiropractic_examination = @accident.chiropractic_examinations.find(params[:chiropractic_examination_id])
  end
end
