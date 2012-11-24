require 'test_helper'

class PlanoSaudesControllerTest < ActionController::TestCase
  setup do
    @plano_saude = plano_saudes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plano_saudes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plano_saude" do
    assert_difference('PlanoSaude.count') do
      post :create, :plano_saude => { :nome => @plano_saude.nome, :numero => @plano_saude.numero, :tipo => @plano_saude.tipo, :validade => @plano_saude.validade }
    end

    assert_redirected_to plano_saude_path(assigns(:plano_saude))
  end

  test "should show plano_saude" do
    get :show, :id => @plano_saude
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @plano_saude
    assert_response :success
  end

  test "should update plano_saude" do
    put :update, :id => @plano_saude, :plano_saude => { :nome => @plano_saude.nome, :numero => @plano_saude.numero, :tipo => @plano_saude.tipo, :validade => @plano_saude.validade }
    assert_redirected_to plano_saude_path(assigns(:plano_saude))
  end

  test "should destroy plano_saude" do
    assert_difference('PlanoSaude.count', -1) do
      delete :destroy, :id => @plano_saude
    end

    assert_redirected_to plano_saudes_path
  end
end
