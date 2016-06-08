class ChiropracticSymptomListsController < ApplicationController
  # GET /chiropractic_symptom_lists
  # GET /chiropractic_symptom_lists.json
  def index
    @chiropractic_symptom_lists = ChiropracticSymptomList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chiropractic_symptom_lists }
    end
  end

  # GET /chiropractic_symptom_lists/1
  # GET /chiropractic_symptom_lists/1.json
  def show
    @chiropractic_symptom_list = ChiropracticSymptomList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_symptom_list }
    end
  end

  # GET /chiropractic_symptom_lists/new
  # GET /chiropractic_symptom_lists/new.json
  def new
    @chiropractic_symptom_list = ChiropracticSymptomList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chiropractic_symptom_list }
    end
  end

  # GET /chiropractic_symptom_lists/1/edit
  def edit
    @chiropractic_symptom_list = ChiropracticSymptomList.find(params[:id])
  end

  # POST /chiropractic_symptom_lists
  # POST /chiropractic_symptom_lists.json
  def create
    @chiropractic_symptom_list = ChiropracticSymptomList.new(params[:chiropractic_symptom_list])

    respond_to do |format|
      if @chiropractic_symptom_list.save
        format.html { redirect_to @chiropractic_symptom_list, notice: 'Chiropractic symptom list was successfully created.' }
        format.json { render json: @chiropractic_symptom_list, status: :created, location: @chiropractic_symptom_list }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_symptom_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chiropractic_symptom_lists/1
  # PUT /chiropractic_symptom_lists/1.json
  def update
    @chiropractic_symptom_list = ChiropracticSymptomList.find(params[:id])

    respond_to do |format|
      if @chiropractic_symptom_list.update_attributes(params[:chiropractic_symptom_list])
        format.html { redirect_to @chiropractic_symptom_list, notice: 'Chiropractic symptom list was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_symptom_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chiropractic_symptom_lists/1
  # DELETE /chiropractic_symptom_lists/1.json
  def destroy
    @chiropractic_symptom_list = ChiropracticSymptomList.find(params[:id])
    @chiropractic_symptom_list.destroy

    respond_to do |format|
      format.html { redirect_to chiropractic_symptom_lists_url }
      format.json { head :ok }
    end
  end
end
