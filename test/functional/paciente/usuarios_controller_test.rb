require 'test_helper'

class Paciente::UsuariosControllerTest < ActionController::TestCase
  setup do
    @paciente_usuario = paciente_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paciente_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paciente_usuario" do
    assert_difference('Paciente::Usuario.count') do
      post :create, :paciente_usuario => { :historico => @paciente_usuario.historico }
    end

    assert_redirected_to paciente_usuario_path(assigns(:paciente_usuario))
  end

  test "should show paciente_usuario" do
    get :show, :id => @paciente_usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @paciente_usuario
    assert_response :success
  end

  test "should update paciente_usuario" do
    put :update, :id => @paciente_usuario, :paciente_usuario => { :historico => @paciente_usuario.historico }
    assert_redirected_to paciente_usuario_path(assigns(:paciente_usuario))
  end

  test "should destroy paciente_usuario" do
    assert_difference('Paciente::Usuario.count', -1) do
      delete :destroy, :id => @paciente_usuario
    end

    assert_redirected_to paciente_usuarios_path
  end
end
