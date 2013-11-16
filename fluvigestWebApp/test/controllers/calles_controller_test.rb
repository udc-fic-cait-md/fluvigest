require 'test_helper'

class CallesControllerTest < ActionController::TestCase
  setup do
    @calle = calles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calle" do
    assert_difference('Calle.count') do
      post :create, calle: { nombre: @calle.nombre, zona: @calle.zona }
    end

    assert_redirected_to calle_path(assigns(:calle))
  end

  test "should show calle" do
    get :show, id: @calle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calle
    assert_response :success
  end

  test "should update calle" do
    patch :update, id: @calle, calle: { nombre: @calle.nombre, zona: @calle.zona }
    assert_redirected_to calle_path(assigns(:calle))
  end

  test "should destroy calle" do
    assert_difference('Calle.count', -1) do
      delete :destroy, id: @calle
    end

    assert_redirected_to calles_path
  end
end
