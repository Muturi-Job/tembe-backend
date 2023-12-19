require "test_helper"

class UserMedicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_medication = user_medications(:one)
  end

  test "should get index" do
    get user_medications_url, as: :json
    assert_response :success
  end

  test "should create user_medication" do
    assert_difference("UserMedication.count") do
      post user_medications_url, params: { user_medication: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show user_medication" do
    get user_medication_url(@user_medication), as: :json
    assert_response :success
  end

  test "should update user_medication" do
    patch user_medication_url(@user_medication), params: { user_medication: {  } }, as: :json
    assert_response :success
  end

  test "should destroy user_medication" do
    assert_difference("UserMedication.count", -1) do
      delete user_medication_url(@user_medication), as: :json
    end

    assert_response :no_content
  end
end
