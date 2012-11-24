require 'test_helper'

class AtendentesControllerTest < ActionController::TestCase
  setup do
    @atendente = atendentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atendentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atendente" do
    assert_difference('Atendente.count') do
      post :create, :atendente => {  }
    end

    assert_redirected_to atendente_path(assigns(:atendente))
  end

  test "should show atendente" do
    get :show, :id => @atendente
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @atendente
    assert_response :success
  end

  test "should update atendente" do
    put :update, :id => @atendente, :atendente => {  }
    assert_redirected_to atendente_path(assigns(:atendente))
  end

  test "should destroy atendente" do
    assert_difference('Atendente.count', -1) do
      delete :destroy, :id => @atendente
    end

    assert_redirected_to atendentes_path
  end
end
