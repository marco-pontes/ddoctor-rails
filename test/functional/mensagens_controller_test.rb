require 'test_helper'

class MensagensControllerTest < ActionController::TestCase
  setup do
    @mensagem = mensagems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mensagems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mensagem" do
    assert_difference('Mensagem.count') do
      post :create, :mensagem => { :assunto => @mensagem.assunto, :corpo => @mensagem.corpo, :destinatario => @mensagem.destinatario, :remetente => @mensagem.remetente, :tipo => @mensagem.tipo }
    end

    assert_redirected_to mensagem_path(assigns(:mensagem))
  end

  test "should show mensagem" do
    get :show, :id => @mensagem
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mensagem
    assert_response :success
  end

  test "should update mensagem" do
    put :update, :id => @mensagem, :mensagem => { :assunto => @mensagem.assunto, :corpo => @mensagem.corpo, :destinatario => @mensagem.destinatario, :remetente => @mensagem.remetente, :tipo => @mensagem.tipo }
    assert_redirected_to mensagem_path(assigns(:mensagem))
  end

  test "should destroy mensagem" do
    assert_difference('Mensagem.count', -1) do
      delete :destroy, :id => @mensagem
    end

    assert_redirected_to mensagems_path
  end
end
