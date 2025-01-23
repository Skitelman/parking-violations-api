require "test_helper"

class ViolationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @violation = violations(:one)
  end

  test "should get index" do
    get violations_url, as: :json
    assert_response :success
  end

  test "should create violation" do
    assert_difference("Violation.count") do
      post violations_url, params: { violation: { plate: @violation.plate } }, as: :json
    end

    assert_response :created
  end

  test "should show violation" do
    get violation_url(@violation), as: :json
    assert_response :success
  end

  test "should update violation" do
    patch violation_url(@violation), params: { violation: { plate: @violation.plate } }, as: :json
    assert_response :success
  end

  test "should destroy violation" do
    assert_difference("Violation.count", -1) do
      delete violation_url(@violation), as: :json
    end

    assert_response :no_content
  end
end
