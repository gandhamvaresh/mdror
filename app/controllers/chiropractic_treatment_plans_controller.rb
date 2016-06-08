class ChiropracticTreatmentPlansController < ApplicationController
  # GET /chiropractic_treatment_plans
  # GET /chiropractic_treatment_plans.json
  def index
    @chiropractic_treatment_plans = ChiropracticTreatmentPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chiropractic_treatment_plans }
    end
  end

  # GET /chiropractic_treatment_plans/1
  # GET /chiropractic_treatment_plans/1.json
  def show
    @chiropractic_treatment_plan = ChiropracticTreatmentPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_treatment_plan }
    end
  end

  # GET /chiropractic_treatment_plans/new
  # GET /chiropractic_treatment_plans/new.json
  def new
    @chiropractic_treatment_plan = ChiropracticTreatmentPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chiropractic_treatment_plan }
    end
  end

  # GET /chiropractic_treatment_plans/1/edit
  def edit
    @chiropractic_treatment_plan = ChiropracticTreatmentPlan.find(params[:id])
  end

  # POST /chiropractic_treatment_plans
  # POST /chiropractic_treatment_plans.json
  def create
    @chiropractic_treatment_plan = ChiropracticTreatmentPlan.new(params[:chiropractic_treatment_plan])

    respond_to do |format|
      if @chiropractic_treatment_plan.save
        format.html { redirect_to @chiropractic_treatment_plan, notice: 'Chiropractic treatment plan was successfully created.' }
        format.json { render json: @chiropractic_treatment_plan, status: :created, location: @chiropractic_treatment_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_treatment_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chiropractic_treatment_plans/1
  # PUT /chiropractic_treatment_plans/1.json
  def update
    @chiropractic_treatment_plan = ChiropracticTreatmentPlan.find(params[:id])

    respond_to do |format|
      if @chiropractic_treatment_plan.update_attributes(params[:chiropractic_treatment_plan])
        format.html { redirect_to @chiropractic_treatment_plan, notice: 'Chiropractic treatment plan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_treatment_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chiropractic_treatment_plans/1
  # DELETE /chiropractic_treatment_plans/1.json
  def destroy
    @chiropractic_treatment_plan = ChiropracticTreatmentPlan.find(params[:id])
    @chiropractic_treatment_plan.destroy

    respond_to do |format|
      format.html { redirect_to chiropractic_treatment_plans_url }
      format.json { head :ok }
    end
  end
end
