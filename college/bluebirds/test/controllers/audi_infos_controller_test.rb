require 'test_helper'

class AudiInfosControllerTest < ActionController::TestCase
  setup do
    @audi_info = audi_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audi_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audi_info" do
    assert_difference('AudiInfo.count') do
      post :create, audi_info: { Pricing_id: @audi_info.Pricing_id, screen_no: @audi_info.screen_no, seat_no: @audi_info.seat_no }
    end

    assert_redirected_to audi_info_path(assigns(:audi_info))
  end

  test "should show audi_info" do
    get :show, id: @audi_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @audi_info
    assert_response :success
  end

  test "should update audi_info" do
    patch :update, id: @audi_info, audi_info: { Pricing_id: @audi_info.Pricing_id, screen_no: @audi_info.screen_no, seat_no: @audi_info.seat_no }
    assert_redirected_to audi_info_path(assigns(:audi_info))
  end

  test "should destroy audi_info" do
    assert_difference('AudiInfo.count', -1) do
      delete :destroy, id: @audi_info
    end

    assert_redirected_to audi_infos_path
  end
end
