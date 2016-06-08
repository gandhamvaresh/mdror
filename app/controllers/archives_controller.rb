class ArchivesController < ApplicationController
  before_filter :login_required
  before_filter :load_client
  before_filter :check_for_mobile
  
  def index
  end

  def users
    @internal_users = User.deleted.where(:client_id => nil).order(:role_id, :name)
    @grouped_external_users = User.deleted.where("client_id is not null").order(:role_id, :name).group_by(&:client_id)
  end

  def clients
    @clients = Client.deleted.order('name').page(params[:page]).per(15)
  end

  def patients
    if @client.blank?
      @patients = Patient.deleted.order('first_name').page(params[:page]).per(15)
    else
      @patients = @client.patients.deleted.order('first_name').page(params[:page]).per(15)
    end
  end

  def accidents
    if @client.blank?    
      @accidents = Accident.deleted.page(params[:page]).per(15)
    else
      @accidents = @client.accidents.where('accidents.deleted_at is not null').page(params[:page]).per(15)
    end
  end

  def chiropractic_examinations
    if @client.blank?
      @chiropractic_examinations = ChiropracticExamination.deleted.order('completed', 'insurance_claim_filed').page(params[:page]).per(15)
    else
      @chiropractic_examinations = @client.chiropractic_examinations.where('chiropractic_examinations.deleted_at is not null').order('completed', 'insurance_claim_filed').page(params[:page]).per(15)
    end
  end

  def chiropractic_treatments
    if @client.blank?
      @chiropractic_treatments = ChiropracticTreatment.deleted.order('completed', 'insurance_claim_filed').page(params[:page]).per(15)
    else
      @chiropractic_treatments = @client.chiropractic_treatments.where('chiropractic_treatments.deleted_at is not null').order('completed', 'insurance_claim_filed').page(params[:page]).per(15)
    end
  end

  def insurance_companies
    @insurance_companies = InsuranceCompany.deleted.order('name').page(params[:page]).per(15)
  end
  
  private
  
  def load_client
    session[:current_tab] = 'Archives'
    
    if current_user.doctor? || current_user.front_desk?
      @client = Client.find(current_user.client_id)
    end
    
  end
end
