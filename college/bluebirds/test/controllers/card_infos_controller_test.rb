require 'test_helper'

class CardInfosControllerTest < ActionController::TestCase
  setup do
    @card_info = card_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_info" do
    assert_difference('CardInfo.count') do
      post :create, card_info: { card_exp_date: @card_info.card_exp_date, card_holdername: @card_info.card_holdername, card_no: @card_info.card_no, card_pin: @card_info.card_pin }
    end

    assert_redirected_to card_info_path(assigns(:card_info))
  end

  test "should show card_info" do
    get :show, id: @card_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_info
    assert_response :success
  end

  test "should update card_info" do
    patch :update, id: @card_info, card_info: { card_exp_date: @card_info.card_exp_date, card_holdername: @card_info.card_holdername, card_no: @card_info.card_no, card_pin: @card_info.card_pin }
    assert_redirected_to card_info_path(assigns(:card_info))
  end

  test "should destroy card_info" do
    assert_difference('CardInfo.count', -1) do
      delete :destroy, id: @card_info
    end

    assert_redirected_to card_infos_path
  end
end
