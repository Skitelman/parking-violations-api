class ViolationsController < ApplicationController
  before_action :set_violation, only: %i[ show update destroy ]

  # GET /violations
  def index
    @violations = Violation.all

    render json: @violations
  end

  # GET /violations/1
  def show
    render json: @violation
  end

  # POST /violations
  def create
    @violation = Violation.new(violation_params)

    if @violation.save
      render json: @violation, status: :created, location: @violation
    else
      render json: @violation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /violations/1
  def update
    if @violation.update(violation_params)
      render json: @violation
    else
      render json: @violation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /violations/1
  def destroy
    @violation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_violation
      @violation = Violation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def violation_params
      params.expect(violation: [ :plate ])
    end
end
