class TestRulesController < ApplicationController
  before_action :set_test_rule, only: [:show, :edit, :update, :destroy]

  # GET /test_rules
  # GET /test_rules.json
  def index
    @test_rules = TestRule.all
  end

  # GET /test_rules/1
  # GET /test_rules/1.json
  def show
  end

  # GET /test_rules/new
  def new
    @test_rule = TestRule.new
  end

  # GET /test_rules/1/edit
  def edit
  end

  # POST /test_rules
  # POST /test_rules.json
  def create
    @test_rule = TestRule.new(test_rule_params)

    respond_to do |format|
      if @test_rule.save
        format.html { redirect_to @test_rule, notice: 'Test rule was successfully created.' }
        format.json { render :show, status: :created, location: @test_rule }
      else
        format.html { render :new }
        format.json { render json: @test_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_rules/1
  # PATCH/PUT /test_rules/1.json
  def update
    respond_to do |format|
      if @test_rule.update(test_rule_params)
        format.html { redirect_to @test_rule, notice: 'Test rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_rule }
      else
        format.html { render :edit }
        format.json { render json: @test_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_rules/1
  # DELETE /test_rules/1.json
  def destroy
    @test_rule.destroy
    respond_to do |format|
      format.html { redirect_to test_rules_url, notice: 'Test rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_rule
      @test_rule = TestRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_rule_params
      params.require(:test_rule).permit(:ruleUserId, :mTestTypeId, :testCount, :maxScore, :maxPoint, :minScore, :minPoint, :midScore, :midPoint)
    end
end
