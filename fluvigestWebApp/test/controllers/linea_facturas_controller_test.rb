require 'test_helper'

class LineaFacturasControllerTest < ActionController::TestCase
  setup do
    @linea_factura = linea_facturas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linea_facturas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linea_factura" do
    assert_difference('LineaFactura.count') do
      post :create, linea_factura: { descripcion: @linea_factura.descripcion, factura_id: @linea_factura.factura_id, numero: @linea_factura.numero }
    end

    assert_redirected_to linea_factura_path(assigns(:linea_factura))
  end

  test "should show linea_factura" do
    get :show, id: @linea_factura
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linea_factura
    assert_response :success
  end

  test "should update linea_factura" do
    patch :update, id: @linea_factura, linea_factura: { descripcion: @linea_factura.descripcion, factura_id: @linea_factura.factura_id, numero: @linea_factura.numero }
    assert_redirected_to linea_factura_path(assigns(:linea_factura))
  end

  test "should destroy linea_factura" do
    assert_difference('LineaFactura.count', -1) do
      delete :destroy, id: @linea_factura
    end

    assert_redirected_to linea_facturas_path
  end
end
