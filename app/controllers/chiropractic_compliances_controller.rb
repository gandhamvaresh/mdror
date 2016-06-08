class ChiropracticCompliancesController < ApplicationController
  # GET /chiropractic_compliances
  # GET /chiropractic_compliances.json
  def index
    @chiropractic_compliances = ChiropracticCompliance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chiropractic_compliances }
    end
  end

  # GET /chiropractic_compliances/1
  # GET /chiropractic_compliances/1.json
  def show
    @chiropractic_compliance = ChiropracticCompliance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_compliance }
    end
  end

  # GET /chiropractic_compliances/new
  # GET /chiropractic_compliances/new.json
  def new
    @chiropractic_compliance = ChiropracticCompliance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chiropractic_compliance }
    end
  end

  # GET /chiropractic_compliances/1/edit
  def edit
    @chiropractic_compliance = ChiropracticCompliance.find(params[:id])
  end

  # POST /chiropractic_compliances
  # POST /chiropractic_compliances.json
  def create
    @chiropractic_compliance = ChiropracticCompliance.new(params[:chiropractic_compliance])

    respond_to do |format|
      if @chiropractic_compliance.save
        format.html { redirect_to @chiropractic_compliance, notice: 'Chiropractic compliance was successfully created.' }
        format.json { render json: @chiropractic_compliance, status: :created, location: @chiropractic_compliance }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_compliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chiropractic_compliances/1
  # PUT /chiropractic_compliances/1.json
  def update
    @chiropractic_compliance = ChiropracticCompliance.find(params[:id])

    respond_to do |format|
      if @chiropractic_compliance.update_attributes(params[:chiropractic_compliance])
        format.html { redirect_to @chiropractic_compliance, notice: 'Chiropractic compliance was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_compliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chiropractic_compliances/1
  # DELETE /chiropractic_compliances/1.json
  def destroy
    @chiropractic_compliance = ChiropracticCompliance.find(params[:id])
    @chiropractic_compliance.destroy

    respond_to do |format|
      format.html { redirect_to chiropractic_compliances_url }
      format.json { head :ok }
    end
  end
end
