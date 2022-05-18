require "test_helper"

class PostalCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postal_code = postal_codes(:one)
  end

  test "should get index" do
    get postal_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_postal_code_url
    assert_response :success
  end

  test "should create postal_code" do
    assert_difference('PostalCode.count') do
      post postal_codes_url, params: { postal_code: { city: @postal_code.city, country: @postal_code.country, latitude: @postal_code.latitude, longitude: @postal_code.longitude, postal_code: @postal_code.postal_code, state: @postal_code.state } }
    end

    assert_redirected_to postal_code_url(PostalCode.last)
  end

  test "should show postal_code" do
    get postal_code_url(@postal_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_postal_code_url(@postal_code)
    assert_response :success
  end

  test "should update postal_code" do
    patch postal_code_url(@postal_code), params: { postal_code: { city: @postal_code.city, country: @postal_code.country, latitude: @postal_code.latitude, longitude: @postal_code.longitude, postal_code: @postal_code.postal_code, state: @postal_code.state } }
    assert_redirected_to postal_code_url(@postal_code)
  end

  test "should destroy postal_code" do
    assert_difference('PostalCode.count', -1) do
      delete postal_code_url(@postal_code)
    end

    assert_redirected_to postal_codes_url
  end
end
