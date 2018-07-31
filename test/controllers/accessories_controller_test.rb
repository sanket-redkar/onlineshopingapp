require 'test_helper'

class AccessoriesControllerTest < ActionController::TestCase
  setup do
    @accessory = accessories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accessories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accessory" do
    assert_difference('Accessory.count') do
      post :create, accessory: { bought_date: @accessory.bought_date, data: @accessory.data, description: @accessory.description, image: @accessory.image, modal_id: @accessory.modal_id, name: @accessory.name, price: @accessory.price, serial_number: @accessory.serial_number, sold_date: @accessory.sold_date }
    end

    assert_redirected_to accessory_path(assigns(:accessory))
  end

  test "should show accessory" do
    get :show, id: @accessory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accessory
    assert_response :success
  end

  test "should update accessory" do
    patch :update, id: @accessory, accessory: { bought_date: @accessory.bought_date, data: @accessory.data, description: @accessory.description, image: @accessory.image, modal_id: @accessory.modal_id, name: @accessory.name, price: @accessory.price, serial_number: @accessory.serial_number, sold_date: @accessory.sold_date }
    assert_redirected_to accessory_path(assigns(:accessory))
  end

  test "should destroy accessory" do
    assert_difference('Accessory.count', -1) do
      delete :destroy, id: @accessory
    end

    assert_redirected_to accessories_path
  end
end
