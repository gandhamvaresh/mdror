class ChiropracticDiagnosisListsController < ApplicationController
  # GET /chiropractic_diagnosis_lists
  # GET /chiropractic_diagnosis_lists.json
  def index
    @chiropractic_diagnosis_lists = ChiropracticDiagnosisList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chiropractic_diagnosis_lists }
    end
  end

  # GET /chiropractic_diagnosis_lists/1
  # GET /chiropractic_diagnosis_lists/1.json
  def show
    @chiropractic_diagnosis_list = ChiropracticDiagnosisList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_diagnosis_list }
    end
  end

  # GET /chiropractic_diagnosis_lists/new
  # GET /chiropractic_diagnosis_lists/new.json
  def new
    @chiropractic_diagnosis_list = ChiropracticDiagnosisList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chiropractic_diagnosis_list }
    end
  end

  # GET /chiropractic_diagnosis_lists/1/edit
  def edit
    @chiropractic_diagnosis_list = ChiropracticDiagnosisList.find(params[:id])
  end

  # POST /chiropractic_diagnosis_lists
  # POST /chiropractic_diagnosis_lists.json
  def create
    @chiropractic_diagnosis_list = ChiropracticDiagnosisList.new(params[:chiropractic_diagnosis_list])

    respond_to do |format|
      if @chiropractic_diagnosis_list.save
        format.html { redirect_to @chiropractic_diagnosis_list, notice: 'Chiropractic diagnosis list was successfully created.' }
        format.json { render json: @chiropractic_diagnosis_list, status: :created, location: @chiropractic_diagnosis_list }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_diagnosis_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chiropractic_diagnosis_lists/1
  # PUT /chiropractic_diagnosis_lists/1.json
  def update
    @chiropractic_diagnosis_list = ChiropracticDiagnosisList.find(params[:id])

    respond_to do |format|
      if @chiropractic_diagnosis_list.update_attributes(params[:chiropractic_diagnosis_list])
        format.html { redirect_to @chiropractic_diagnosis_list, notice: 'Chiropractic diagnosis list was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_diagnosis_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chiropractic_diagnosis_lists/1
  # DELETE /chiropractic_diagnosis_lists/1.json
  def destroy
    @chiropractic_diagnosis_list = ChiropracticDiagnosisList.find(params[:id])
    @chiropractic_diagnosis_list.destroy

    respond_to do |format|
      format.html { redirect_to chiropractic_diagnosis_lists_url }
      format.json { head :ok }
    end
  end
end
