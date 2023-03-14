require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test 'should get index' do
    get vehicles_url, as: :json
    assert_response :success
  end

  test 'should create vehicle' do
    assert_difference('Vehicle.count') do
      post vehicles_url, params: { vehicle: {} }, as: :json
    end

    assert_response :created
  end

  test 'should show vehicle' do
    get vehicle_url(@vehicle), as: :json
    assert_response :success
  end

  test 'should update vehicle' do
    patch vehicle_url(@vehicle), params: { vehicle: {} }, as: :json
    assert_response :success
  end

  test 'should destroy vehicle' do
    assert_difference('Vehicle.count', -1) do
      delete vehicle_url(@vehicle), as: :json
    end

    assert_response :no_content
  end
end
