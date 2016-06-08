class ChiropracticInvestigationListsController < ApplicationController
  # GET /chiropractic_investigation_lists
  # GET /chiropractic_investigation_lists.json
  def index
    @chiropractic_investigation_lists = ChiropracticInvestigationList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chiropractic_investigation_lists }
    end
  end

  # GET /chiropractic_investigation_lists/1
  # GET /chiropractic_investigation_lists/1.json
  def show
    @chiropractic_investigation_list = ChiropracticInvestigationList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chiropractic_investigation_list }
    end
  end

  # GET /chiropractic_investigation_lists/new
  # GET /chiropractic_investigation_lists/new.json
  def new
    @chiropractic_investigation_list = ChiropracticInvestigationList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chiropractic_investigation_list }
    end
  end

  # GET /chiropractic_investigation_lists/1/edit
  def edit
    @chiropractic_investigation_list = ChiropracticInvestigationList.find(params[:id])
  end

  # POST /chiropractic_investigation_lists
  # POST /chiropractic_investigation_lists.json
  def create
    @chiropractic_investigation_list = ChiropracticInvestigationList.new(params[:chiropractic_investigation_list])

    respond_to do |format|
      if @chiropractic_investigation_list.save
        format.html { redirect_to @chiropractic_investigation_list, notice: 'Chiropractic investigation list was successfully created.' }
        format.json { render json: @chiropractic_investigation_list, status: :created, location: @chiropractic_investigation_list }
      else
        format.html { render action: "new" }
        format.json { render json: @chiropractic_investigation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chiropractic_investigation_lists/1
  # PUT /chiropractic_investigation_lists/1.json
  def update
    @chiropractic_investigation_list = ChiropracticInvestigationList.find(params[:id])

    respond_to do |format|
      if @chiropractic_investigation_list.update_attributes(params[:chiropractic_investigation_list])
        format.html { redirect_to @chiropractic_investigation_list, notice: 'Chiropractic investigation list was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiropractic_investigation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chiropractic_investigation_lists/1
  # DELETE /chiropractic_investigation_lists/1.json
  def destroy
    @chiropractic_investigation_list = ChiropracticInvestigationList.find(params[:id])
    @chiropractic_investigation_list.destroy

    respond_to do |format|
      format.html { redirect_to chiropractic_investigation_lists_url }
      format.json { head :ok }
    end
  end
end
