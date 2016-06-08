class ChiropracticExaminationsController < ApplicationController
  before_filter :login_required
  before_filter :load_client_patient_and_accident
  before_filter :check_for_mobile
  
  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations(.:format)  
  def index
    @chiropractic_examinations = @accident.chiropractic_examinations.not_deleted.order('completed', 'insurance_claim_filed').page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chiropractic_examinations }
    end
  end

  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:id(.:format)
  def show
    @chiropractic_examination = @accident.chiropractic_examinations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_examination }
    end
  end

  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:id/print_friendly(.:format)
  def print_friendly
    @chiropractic_examination = @accident.chiropractic_examinations.find(params[:id]) 
    
    respond_to do |format|
      format.html { render :layout => 'no_header_footer' }
      format.json { render json: @chiropractic_treatment }
    end
  end
  
  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/new(.:format)
  def new
    if @accident.chiropractic_examinations.blank?
      @chiropractic_examination = @accident.chiropractic_examinations.build(:initial_examination => true, :client_id => @client.id)
      @chiropractic_examination.build_chiropractic_symptom_list
      @chiropractic_examination.build_chiropractic_investigation_list
      @chiropractic_examination.build_chiropractic_diagnosis_list
      @chiropractic_examination.build_chiropractic_assessment
      @chiropractic_examination.build_chiropractic_treatment_plan
      @chiropractic_examination.build_chiropractic_compliance 
    else
      most_recent_examination = @accident.chiropractic_examinations.last
      @chiropractic_examination = @accident.chiropractic_examinations.build(:initial_examination => false, :client_id => @client.id)
      @chiropractic_examination.build_chiropractic_symptom_list(most_recent_examination.chiropractic_symptom_list.attributes)
      @chiropractic_examination.build_chiropractic_investigation_list(most_recent_examination.chiropractic_investigation_list.attributes)
      @chiropractic_examination.build_chiropractic_diagnosis_list(most_recent_examination.chiropractic_diagnosis_list.attributes)
      @chiropractic_examination.build_chiropractic_assessment(most_recent_examination.chiropractic_assessment.attributes)
      @chiropractic_examination.build_chiropractic_treatment_plan(most_recent_examination.chiropractic_treatment_plan.attributes)
      @chiropractic_examination.build_chiropractic_compliance(most_recent_examination.chiropractic_compliance.attributes)
    end
    
    @chiropractic_examination.save!
    
    respond_to do |format|
      format.html { redirect_to edit_patient_accident_chiropractic_examination_path(@patient, @accident, @chiropractic_examination) }
      format.json { render json: @chiropractic_examination }
    end
  end

  # POST /patients/:patient_id/accidents/:accident_id/chiropractic_examinations(.:format) 
  def create
    @chiropractic_examination = @accident.chiropractic_examinations.build(params[:chiropractic_examination])
    
    respond_to do |format|
      if @chiropractic_examination.save
        format.html { redirect_to patient_accident_chiropractic_examination_path(@patient, @accident, @chiropractic_examination), notice: 'Chiropractic examination was successfully created.' }
        format.json { render json: @chiropractic_examination, status: :created, location: @chiropractic_examination }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_examination.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:id/edit(.:format)
  def edit
    @chiropractic_examination = @accident.chiropractic_examinations.find(params[:id])
  end

  # PUT /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:id(.:format)
  def update
    @chiropractic_examination = @accident.chiropractic_examinations.find(params[:id])
    form_completed_earlier = @chiropractic_examination.completed?
    
    if params[:back_button]
      @chiropractic_examination.previous_step
    else
      @chiropractic_examination.next_step
    end
    
    respond_to do |format|
      if @chiropractic_examination.update_attributes(params[:chiropractic_examination])
        if !form_completed_earlier && @chiropractic_examination.completed?
          @chiropractic_examination.completed_at = Time.now
          @chiropractic_examination.completed_by = current_user.id
          @chiropractic_examination.save!
        end
        
        format.html { 
          if params[:done_button]
            redirect_to patient_accident_chiropractic_examination_path(@patient, @accident, @chiropractic_examination), notice: 'Chiropractic examination was successfully updated.' 
          else
            render action: "edit"
          end
        }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:id(.:format)
  def destroy
    @chiropractic_examination = @accident.chiropractic_examinations.find(params[:id])
    
    if @chiropractic_examination.deleted_at.blank?
      @chiropractic_examination.destroy
    else
      @chiropractic_examination.revive
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
  
  # GET /patients/:patient_id/accidents/:accident_id/chiropractic_examinations/:id/insurance_claim_processed(.:format)
  def insurance_claim_processed
    @chiropractic_examination = @accident.chiropractic_examinations.find(params[:id])
    @chiropractic_examination.insurance_claim_filed = true
    @chiropractic_examination.insurance_claim_filed_at = Time.now
    @chiropractic_examination.insurance_claim_filed_by = current_user.id
    @chiropractic_examination.save!
    
    respond_to do |format|
      format.html { redirect_to patient_accident_chiropractic_examination_path(@patient, @accident, @chiropractic_examination), notice: 'Chiropractic examination was successfully marked as submitted for medical insurance claim.' }
      format.json { head :ok }
    end
  end
  
  private
  
  def load_client_patient_and_accident
    if current_user.admin? || current_user.staff?
      session[:current_tab] = 'Clients'  unless session[:current_tab] == 'Archives'
      @client = Patient.find(params[:patient_id]).client
    else
      session[:current_tab] = 'Patients'  unless session[:current_tab] == 'Archives'
      @client = Client.find(current_user.client_id)
    end
    
    @patient = @client.patients.find(params[:patient_id])
    @accident = @patient.accidents.find(params[:accident_id])
  end
end
