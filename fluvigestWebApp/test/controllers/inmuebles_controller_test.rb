require 'test_helper'

class InmueblesControllerTest < ActionController::TestCase
  setup do
    @inmueble = inmuebles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inmuebles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inmueble" do
    assert_difference('Inmueble.count') do
      post :create, inmueble: { cod_postal: @inmueble.cod_postal, escalera: @inmueble.escalera, inmueblescol: @inmueble.inmueblescol, nombre: @inmueble.nombre, numero: @inmueble.numero, orden: @inmueble.orden, piso: @inmueble.piso, portal: @inmueble.portal, puerta: @inmueble.puerta }
    end

    assert_redirected_to inmueble_path(assigns(:inmueble))
  end

  test "should show inmueble" do
    get :show, id: @inmueble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inmueble
    assert_response :success
  end

  test "should update inmueble" do
    patch :update, id: @inmueble, inmueble: { cod_postal: @inmueble.cod_postal, escalera: @inmueble.escalera, inmueblescol: @inmueble.inmueblescol, nombre: @inmueble.nombre, numero: @inmueble.numero, orden: @inmueble.orden, piso: @inmueble.piso, portal: @inmueble.portal, puerta: @inmueble.puerta }
    assert_redirected_to inmueble_path(assigns(:inmueble))
  end

  test "should destroy inmueble" do
    assert_difference('Inmueble.count', -1) do
      delete :destroy, id: @inmueble
    end

    assert_redirected_to inmuebles_path
  end
end
