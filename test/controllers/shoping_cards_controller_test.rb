require 'test_helper'

class ShopingCardsControllerTest < ActionController::TestCase
  setup do
    @shoping_card = shoping_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shoping_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shoping_card" do
    assert_difference('ShopingCard.count') do
      post :create, shoping_card: { status: @shoping_card.status, user_id: @shoping_card.user_id }
    end

    assert_redirected_to shoping_card_path(assigns(:shoping_card))
  end

  test "should show shoping_card" do
    get :show, id: @shoping_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shoping_card
    assert_response :success
  end

  test "should update shoping_card" do
    patch :update, id: @shoping_card, shoping_card: { status: @shoping_card.status, user_id: @shoping_card.user_id }
    assert_redirected_to shoping_card_path(assigns(:shoping_card))
  end

  test "should destroy shoping_card" do
    assert_difference('ShopingCard.count', -1) do
      delete :destroy, id: @shoping_card
    end

    assert_redirected_to shoping_cards_path
  end
end
