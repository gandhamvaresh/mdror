class PatientsController < ApplicationController
  before_filter :login_required
  before_filter :load_client
  before_filter :check_for_mobile
  
  # GET /patients
  # GET /patients.json
  def index
    if params[:search]
      session[:filter] = params[:filter]
      session[:search] = params[:search]
      @patients = @client.patients.where("#{params[:filter]} like ?", "%#{params[:search]}%").order('id desc').page(params[:page]).per(15)
    else
      @patients = @client.patients.order('first_name').page(params[:page]).per(15)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = @client.patients.find(params[:id]) unless current_user.staff?
    @patient = Patient.find(params[:id]) if current_user.staff?
    
    # Build patient history (table) of cases, examinations and treatments
    @patient_history = []
    @patient.accidents.each do |accident|
      record = []
      record[0] = accident.id
      @patient_history << record if accident.chiropractic_examinations.blank?
      accident.chiropractic_examinations.each do |examination|
        record = []
        record[0] = accident.id
        record[1] = examination.id
        @patient_history << record if examination.chiropractic_treatments.blank?
        examination.chiropractic_treatments.each do |treatment|
          record = []
          record[0] = accident.id
          record[1] = examination.id
          record[2] = treatment.id
          @patient_history << record
        end
      end
    end
        
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = @client.patients.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = @client.patients.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = @client.patients.build(params[:patient])
    
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = @client.patients.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = @client.patients.find(params[:id]) unless current_user.admin?
    @patient = Patient.find(params[:id]) if current_user.admin?
    if @patient.deleted_at.blank?
      @patient.destroy(validate: false)
    else
      @patient.revive(validate: false)
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
  
  def remove
    @patient = @client.patients.find(params[:patient_id])
    @patient.delete
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end

  private
  
  def load_client
    @client = Client.find(current_user.client_id) if !(current_user.staff? || current_user.admin?)
    session[:current_tab] = 'Patients'
  end
end
