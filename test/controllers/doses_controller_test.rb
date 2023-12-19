require "test_helper"

class DosesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dose = doses(:one)
  end

  test "should get index" do
    get doses_url, as: :json
    assert_response :success
  end

  test "should create dose" do
    assert_difference("Dose.count") do
      post doses_url, params: { dose: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show dose" do
    get dose_url(@dose), as: :json
    assert_response :success
  end

  test "should update dose" do
    patch dose_url(@dose), params: { dose: {  } }, as: :json
    assert_response :success
  end

  test "should destroy dose" do
    assert_difference("Dose.count", -1) do
      delete dose_url(@dose), as: :json
    end

    assert_response :no_content
  end
end
