require 'test_helper'

class PassagesControllerTest < ActionController::TestCase
  setup do
    @passage = passages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:passages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create passage" do
    assert_difference('Passage.count') do
      post :create, passage: { content: @passage.content }
    end

    assert_redirected_to passage_path(assigns(:passage))
  end

  test "should show passage" do
    get :show, id: @passage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @passage
    assert_response :success
  end

  test "should update passage" do
    patch :update, id: @passage, passage: { content: @passage.content }
    assert_redirected_to passage_path(assigns(:passage))
  end

  test "should destroy passage" do
    assert_difference('Passage.count', -1) do
      delete :destroy, id: @passage
    end

    assert_redirected_to passages_path
  end
end
