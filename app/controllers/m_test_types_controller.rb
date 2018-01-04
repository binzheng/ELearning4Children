class MTestTypesController < ApplicationController
  before_action :set_m_test_type, only: [:show, :edit, :update, :destroy]

  # GET /m_test_types
  # GET /m_test_types.json
  def index
    @m_test_types = MTestType.all
  end
    
  def showList
    @m_test_types = MTestType.where("parentTypeId not ?",nil)
  end
    
  # GET /m_test_types/1
  # GET /m_test_types/1.json
  def show
  end

  # GET /m_test_types/new
  def new
    @m_test_type = MTestType.new
  end

  # GET /m_test_types/1/edit
  def edit
  end

  # POST /m_test_types
  # POST /m_test_types.json
  def create
    @m_test_type = MTestType.new(m_test_type_params)

    respond_to do |format|
      if @m_test_type.save
        format.html { redirect_to @m_test_type, notice: 'M test type was successfully created.' }
        format.json { render :show, status: :created, location: @m_test_type }
      else
        format.html { render :new }
        format.json { render json: @m_test_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /m_test_types/1
  # PATCH/PUT /m_test_types/1.json
  def update
    respond_to do |format|
      if @m_test_type.update(m_test_type_params)
        format.html { redirect_to @m_test_type, notice: 'M test type was successfully updated.' }
        format.json { render :show, status: :ok, location: @m_test_type }
      else
        format.html { render :edit }
        format.json { render json: @m_test_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /m_test_types/1
  # DELETE /m_test_types/1.json
  def destroy
    @m_test_type.destroy
    respond_to do |format|
      format.html { redirect_to m_test_types_url, notice: 'M test type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_m_test_type
      @m_test_type = MTestType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def m_test_type_params
      params.require(:m_test_type).permit(:testName, :testUrl, :testSize, :created_id, :updated_id)
    end
end
