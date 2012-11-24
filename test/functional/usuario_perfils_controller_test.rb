require 'test_helper'

class UsuarioPerfilsControllerTest < ActionController::TestCase
  setup do
    @usuario_perfil = usuario_perfils(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuario_perfils)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario_perfil" do
    assert_difference('UsuarioPerfil.count') do
      post :create, :usuario_perfil => {  }
    end

    assert_redirected_to usuario_perfil_path(assigns(:usuario_perfil))
  end

  test "should show usuario_perfil" do
    get :show, :id => @usuario_perfil
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @usuario_perfil
    assert_response :success
  end

  test "should update usuario_perfil" do
    put :update, :id => @usuario_perfil, :usuario_perfil => {  }
    assert_redirected_to usuario_perfil_path(assigns(:usuario_perfil))
  end

  test "should destroy usuario_perfil" do
    assert_difference('UsuarioPerfil.count', -1) do
      delete :destroy, :id => @usuario_perfil
    end

    assert_redirected_to usuario_perfils_path
  end
end
