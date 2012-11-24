require 'test_helper'

class MedicacoesControllerTest < ActionController::TestCase
  setup do
    @medicacao = medicacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicacao" do
    assert_difference('Medicacao.count') do
      post :create, :medicacao => { :bula => @medicacao.bula, :data_compra => @medicacao.data_compra, :fabricante => @medicacao.fabricante, :nome => @medicacao.nome, :quantidade => @medicacao.quantidade, :tarja => @medicacao.tarja, :unidade => @medicacao.unidade }
    end

    assert_redirected_to medicacao_path(assigns(:medicacao))
  end

  test "should show medicacao" do
    get :show, :id => @medicacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @medicacao
    assert_response :success
  end

  test "should update medicacao" do
    put :update, :id => @medicacao, :medicacao => { :bula => @medicacao.bula, :data_compra => @medicacao.data_compra, :fabricante => @medicacao.fabricante, :nome => @medicacao.nome, :quantidade => @medicacao.quantidade, :tarja => @medicacao.tarja, :unidade => @medicacao.unidade }
    assert_redirected_to medicacao_path(assigns(:medicacao))
  end

  test "should destroy medicacao" do
    assert_difference('Medicacao.count', -1) do
      delete :destroy, :id => @medicacao
    end

    assert_redirected_to medicacoes_path
  end
end
