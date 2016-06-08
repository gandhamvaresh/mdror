class UsersController < ApplicationController
  before_filter :login_required
  before_filter :set_current_tab
  before_filter :check_for_mobile
  
  # GET /users
  # GET /users.json
  def index
    @users = User.not_deleted.where(:client_id => nil).order(:role_id, :name).page(params[:page]).per(15)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def new
    @user = User.new
  end

  def new_external
    session[:current_tab] = 'Clients'
    @client = Client.find(params[:client_id])
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => "Signed up!"  if @user.client.blank?
      redirect_to users_client_path(@user.client), :notice => "Signed up!" if @user.client
    else
      render "new" if @user.client.blank?
      render "new_external" if @user.client
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.digital_signature = nil if params[:remove_digital_signature]
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { 
          redirect_to users_url, notice: 'User was successfully updated.' if @user.client.blank?
          redirect_to users_client_path(@user.client), :notice => "User was successfully updated" if @user.client
        }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    client = @user.client
    
    if @user.deleted_at.blank?
      @user.destroy
    else
      @user.revive
    end
    
    respond_to do |format|
      format.html { 
        if session[:current_tab] == 'Archives'
          redirect_to archives_users_path
        elsif client.blank?
          redirect_to users_path
        else
          redirect_to users_client_path(client)
        end
      }
      format.json { head :ok }
    end
  end
  
  #GET /users/doctor_dashboard(.:format)
  def doctor_dashboard
    session[:current_tab] = 'Dashboard'
    @client = current_user.client
    
    @pending_chiropractic_treatments = ChiropracticTreatment.not_deleted.where(:client_id => @client.id, :completed => false)
    @pending_chiropractic_examinations = ChiropracticExamination.not_deleted.where(:client_id => @client.id, :completed => false)
    
    # http://www.freeopenbook.com/mysqlcookbook/mysqlckbk-chp-12-sect-6.html
    @new_patients = Patient.where(:client_id => @client.id).order('created_at DESC').limit(50).select { |patient| patient.chiropractic_examinations.blank? }
    
    # http://www.freeopenbook.com/mysqlcookbook/mysqlckbk-chp-12-sect-7.html
    accident_ids = @client.chiropractic_examinations.not_deleted.select("accident_id, max(examination_date) as last_examination_date").group("accident_id").having("last_examination_date < ?", Date.today - 28.days).collect { |chiropractic_examination| chiropractic_examination.accident_id }
    accidents = Accident.includes(:patient).find(accident_ids)
    @reminder_patients = accidents.collect { |accident| accident.patient.decorate }
    @reminder_patients.select! {|patient| !patient.ignore_re_examination_reminders}#.sort_by { ||}
  end
  
  # GET /users/1/ignore_re_examination_reminders(.:format)
  def ignore_re_examination_reminders
    user = User.find(params[:id])
    user.ignore_re_examination_reminders = true
    user.save!
    redirect_to doctor_dashboard_users_path
  end
  
  private
  
  def set_current_tab
    session[:current_tab] = 'Users' unless session[:current_tab] == 'Archives'
  end
end
