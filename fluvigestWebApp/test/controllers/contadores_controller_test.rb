require 'test_helper'

class ContadoresControllerTest < ActionController::TestCase
  setup do
    @contadore = contadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contadore" do
    assert_difference('Contadore.count') do
      post :create, contadore: { calibre: @contadore.calibre, dt_instalacion: @contadore.dt_instalacion, dt_retirada: @contadore.dt_retirada, dt_revision: @contadore.dt_revision, estado: @contadore.estado, num_serie: @contadore.num_serie }
    end

    assert_redirected_to contadore_path(assigns(:contadore))
  end

  test "should show contadore" do
    get :show, id: @contadore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contadore
    assert_response :success
  end

  test "should update contadore" do
    patch :update, id: @contadore, contadore: { calibre: @contadore.calibre, dt_instalacion: @contadore.dt_instalacion, dt_retirada: @contadore.dt_retirada, dt_revision: @contadore.dt_revision, estado: @contadore.estado, num_serie: @contadore.num_serie }
    assert_redirected_to contadore_path(assigns(:contadore))
  end

  test "should destroy contadore" do
    assert_difference('Contadore.count', -1) do
      delete :destroy, id: @contadore
    end

    assert_redirected_to contadores_path
  end
end
