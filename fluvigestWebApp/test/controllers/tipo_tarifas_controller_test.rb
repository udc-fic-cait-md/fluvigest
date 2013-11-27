require 'test_helper'

class TipoTarifasControllerTest < ActionController::TestCase
  setup do
    @tipo_tarifa = tipo_tarifas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_tarifas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_tarifa" do
    assert_difference('TipoTarifa.count') do
      post :create, tipo_tarifa: {  }
    end

    assert_redirected_to tipo_tarifa_path(assigns(:tipo_tarifa))
  end

  test "should show tipo_tarifa" do
    get :show, id: @tipo_tarifa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_tarifa
    assert_response :success
  end

  test "should update tipo_tarifa" do
    patch :update, id: @tipo_tarifa, tipo_tarifa: {  }
    assert_redirected_to tipo_tarifa_path(assigns(:tipo_tarifa))
  end

  test "should destroy tipo_tarifa" do
    assert_difference('TipoTarifa.count', -1) do
      delete :destroy, id: @tipo_tarifa
    end

    assert_redirected_to tipo_tarifas_path
  end
end
