class InsuranceCompaniesController < ApplicationController
  before_filter :login_required
  before_filter :set_current_tab
  
  # GET /insurance_companies
  # GET /insurance_companies.json
  def index
    @insurance_companies = InsuranceCompany.not_deleted.order('name').page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @insurance_companies }
    end
  end

  # GET /insurance_companies/1
  # GET /insurance_companies/1.json
  def show
    @insurance_company = InsuranceCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @insurance_company }
    end
  end

  # GET /insurance_companies/new
  # GET /insurance_companies/new.json
  def new
    @insurance_company = InsuranceCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @insurance_company }
    end
  end

  # GET /insurance_companies/1/edit
  def edit
    @insurance_company = InsuranceCompany.find(params[:id])
  end

  # POST /insurance_companies
  # POST /insurance_companies.json
  def create
    @insurance_company = InsuranceCompany.new(params[:insurance_company])

    respond_to do |format|
      if @insurance_company.save
        format.html { redirect_to @insurance_company, notice: 'Insurance company was successfully created.' }
        format.json { render json: @insurance_company, status: :created, location: @insurance_company }
      else
        format.html { render action: "new" }
        format.json { render json: @insurance_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /insurance_companies/1
  # PUT /insurance_companies/1.json
  def update
    @insurance_company = InsuranceCompany.find(params[:id])

    respond_to do |format|
      if @insurance_company.update_attributes(params[:insurance_company])
        format.html { redirect_to @insurance_company, notice: 'Insurance company was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @insurance_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_companies/1
  # DELETE /insurance_companies/1.json
  def destroy
    @insurance_company = InsuranceCompany.find(params[:id])

    if @insurance_company.deleted_at.blank?
      @insurance_company.destroy
    else
      @insurance_company.revive
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
  
  private
  
  def set_current_tab
    session[:current_tab] = 'Insurance Companies'
  end
end
