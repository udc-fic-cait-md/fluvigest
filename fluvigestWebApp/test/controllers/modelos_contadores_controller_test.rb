require 'test_helper'

class ModelosContadoresControllerTest < ActionController::TestCase
  setup do
    @modelos_contadore = modelos_contadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modelos_contadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modelos_contadore" do
    assert_difference('ModelosContadore.count') do
      post :create, modelos_contadore: { marca: @modelos_contadore.marca, modelo: @modelos_contadore.modelo }
    end

    assert_redirected_to modelos_contadore_path(assigns(:modelos_contadore))
  end

  test "should show modelos_contadore" do
    get :show, id: @modelos_contadore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modelos_contadore
    assert_response :success
  end

  test "should update modelos_contadore" do
    patch :update, id: @modelos_contadore, modelos_contadore: { marca: @modelos_contadore.marca, modelo: @modelos_contadore.modelo }
    assert_redirected_to modelos_contadore_path(assigns(:modelos_contadore))
  end

  test "should destroy modelos_contadore" do
    assert_difference('ModelosContadore.count', -1) do
      delete :destroy, id: @modelos_contadore
    end

    assert_redirected_to modelos_contadores_path
  end
end
