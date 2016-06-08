class ClientsController < ApplicationController
  before_filter :login_required
  before_filter :set_current_tab
  before_filter :check_for_mobile
  
  # GET /clients
  # GET /clients.json
  def index
    if params[:search]
      session[:filter] = params[:filter]
      session[:search] = params[:search]
      @patients = Patient.joins(:client).where("clients.id = #{params[:filter_client]} AND clients.deleted_at IS NULL AND #{params[:filter]} like ?", "%#{params[:search]}%").order('id desc').page(params[:page]).per(15)
      @clients = []
    else
      @clients = Client.not_deleted.order('name').page(params[:page]).per(15)
      @patients = []
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])
    @client.report_header = nil if params[:remove_report_header]
    
    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    
    if @client.deleted_at.blank?
      @client.destroy
    else
      @client.revive
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
  
  # GET /clients/:id/users(.:format)
  def users
    @client = Client.find(params[:id])
    @users = @client.users.not_deleted.page(params[:page]).per(15)
  end
  
  # GET /clients/:id/pending_examinations(.:format)
  def pending_examinations
    session[:current_tab] = 'PendingExaminations'
    @client = Client.find(params[:id])
    @chiropractic_examinations = ChiropracticExamination.not_deleted.where(:client_id => @client.id, :completed => false).page(params[:page]).per(15)
  end
  
  # GET /clients/:id/completed_examinations(.:format)
  def completed_examinations
    session[:current_tab] = 'CompletedExaminations'
    @client = Client.find(params[:id])
    if current_user.admin? || current_user.staff?
      @chiropractic_examinations = ChiropracticExamination.not_deleted.where(:client_id => @client.id, :completed => true, :insurance_claim_filed => false).page(params[:page]).per(15)
    else
      @chiropractic_examinations = ChiropracticExamination.not_deleted.where(:client_id => @client.id, :completed => true).order('insurance_claim_filed').page(params[:page]).per(15)
    end
  end
  
  # GET /clients/:id/processed_examinations(.:format)
  def processed_examinations
    @client = Client.find(params[:id])
    @chiropractic_examinations = ChiropracticExamination.not_deleted.where(:client_id => @client.id, :completed => true, :insurance_claim_filed => true).page(params[:page]).per(15)
  end
  
  # GET /clients/:id/pending_treatments(.:format)
  def pending_treatments
    session[:current_tab] = 'PendingTreatments'
    @client = Client.find(params[:id])
    @chiropractic_treatments = ChiropracticTreatment.not_deleted.where(:client_id => @client.id, :completed => false).page(params[:page]).per(15)
  end
  
  # GET /clients/:id/completed_treatments(.:format)
  def completed_treatments
    session[:current_tab] = 'CompletedTreatments'
    @client = Client.find(params[:id])
    if current_user.admin? || current_user.staff?
      @chiropractic_treatments = ChiropracticTreatment.not_deleted.where(:client_id => @client.id, :completed => true, :insurance_claim_filed => false).page(params[:page]).per(15)
    else
       @chiropractic_treatments = ChiropracticTreatment.not_deleted.where(:client_id => @client.id, :completed => true).order('insurance_claim_filed').page(params[:page]).per(15)
    end
  end
  
  # GET /clients/:id/processed_treatments(.:format)
  def processed_treatments
    @client = Client.find(params[:id])
    @chiropractic_treatments = ChiropracticTreatment.not_deleted.where(:client_id => @client.id, :completed => true, :insurance_claim_filed => true).page(params[:page]).per(15)
  end
  
  private
  
  def set_current_tab
    session[:current_tab] = 'Clients'
  end
end
