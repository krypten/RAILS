require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { BillingInfo_id: @order.BillingInfo_id, Courier_id: @order.Courier_id, User_id: @order.User_id, mode_of_collection: @order.mode_of_collection, payment_success: @order.payment_success, quantity: @order.quantity, total_amount: @order.total_amount }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { BillingInfo_id: @order.BillingInfo_id, Courier_id: @order.Courier_id, User_id: @order.User_id, mode_of_collection: @order.mode_of_collection, payment_success: @order.payment_success, quantity: @order.quantity, total_amount: @order.total_amount }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
