class AccidentsController < ApplicationController
  before_filter :login_required
  before_filter :load_client_and_patient
  before_filter :check_for_mobile
  
  # GET /patients/:patient_id/accidents(.:format)
  def index
    @accidents = @patient.accidents.not_deleted.order('created_at desc').page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accidents }
    end
  end

  # GET /patients/:patient_id/accidents/:id(.:format)
  def show
    @accident = @patient.accidents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accident }
    end
  end

  # GET /patients/:patient_id/accidents/new(.:format)
  def new
    @accident = @patient.accidents.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accident }
    end
  end

  # GET /patients/:patient_id/accidents/:id/edit(.:format)
  def edit
    @accident = @patient.accidents.find(params[:id])
  end

  # POST /patients/:patient_id/accidents(.:format)
  def create
    @accident = @patient.accidents.build(params[:accident])
        
    respond_to do |format|
      if @accident.save
        format.html { redirect_to patient_accident_path(@patient, @accident), notice: 'Case was successfully created.' }
        format.json { render json: @accident, status: :created, location: @accident }
      else
        format.html { render action: "new" }
        format.json { render json: @accident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/:patient_id/accidents/:id(.:format)
  def update
    @accident = @patient.accidents.find(params[:id])    
    
    respond_to do |format|
      if @accident.update_attributes(params[:accident])
        format.html { redirect_to patient_accident_path(@patient, @accident), notice: 'Case was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @accident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/:patient_id/accidents/:id(.:format)
  def destroy
    @accident = Accident.find(params[:id])
    
    if @accident.deleted_at.blank?
      @accident.destroy
    else
      @accident.revive
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
  
  private
  
  def load_client_and_patient
    session[:current_tab] = 'Patients' unless session[:current_tab] == 'Archives'
    
    if current_user.admin? || current_user.staff?
      @client = Patient.find(params[:patient_id]).client
    else
      @client = Client.find(current_user.client_id)
    end
    
    @patient = @client.patients.find(params[:patient_id])
  end
end
