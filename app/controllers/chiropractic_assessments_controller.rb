class ChiropracticAssessmentsController < ApplicationController
  # GET /chiropractic_assessments
  # GET /chiropractic_assessments.json
  def index
    @chiropractic_assessments = ChiropracticAssessment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chiropractic_assessments }
    end
  end

  # GET /chiropractic_assessments/1
  # GET /chiropractic_assessments/1.json
  def show
    @chiropractic_assessment = ChiropracticAssessment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_assessment }
    end
  end

  # GET /chiropractic_assessments/new
  # GET /chiropractic_assessments/new.json
  def new
    @chiropractic_assessment = ChiropracticAssessment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chiropractic_assessment }
    end
  end

  # GET /chiropractic_assessments/1/edit
  def edit
    @chiropractic_assessment = ChiropracticAssessment.find(params[:id])
  end

  # POST /chiropractic_assessments
  # POST /chiropractic_assessments.json
  def create
    @chiropractic_assessment = ChiropracticAssessment.new(params[:chiropractic_assessment])

    respond_to do |format|
      if @chiropractic_assessment.save
        format.html { redirect_to @chiropractic_assessment, notice: 'Chiropractic assessment was successfully created.' }
        format.json { render json: @chiropractic_assessment, status: :created, location: @chiropractic_assessment }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chiropractic_assessments/1
  # PUT /chiropractic_assessments/1.json
  def update
    @chiropractic_assessment = ChiropracticAssessment.find(params[:id])

    respond_to do |format|
      if @chiropractic_assessment.update_attributes(params[:chiropractic_assessment])
        format.html { redirect_to @chiropractic_assessment, notice: 'Chiropractic assessment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chiropractic_assessments/1
  # DELETE /chiropractic_assessments/1.json
  def destroy
    @chiropractic_assessment = ChiropracticAssessment.find(params[:id])
    @chiropractic_assessment.destroy

    respond_to do |format|
      format.html { redirect_to chiropractic_assessments_url }
      format.json { head :ok }
    end
  end
end
