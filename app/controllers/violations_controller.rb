class ViolationsController < ApplicationController
  before_action :initializie_api

  # GET /violations/1
  def show
    violations = @api.violations_by_plate(params[:id])
    puts violations
    render json: violations
  end

  private
    def initializie_api 
      @api = NycOpenViolationsApi.new
    end

    # Only allow a list of trusted parameters through.
    def violation_params
      params.expect(violation: [ :plate ])
    end
end
