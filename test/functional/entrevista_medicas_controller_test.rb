require 'test_helper'

class EntrevistaMedicasControllerTest < ActionController::TestCase
  setup do
    @entrevista_medica = entrevista_medicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrevista_medicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entrevista_medica" do
    assert_difference('EntrevistaMedica.count') do
      post :create, :entrevista_medica => { :altura => @entrevista_medica.altura, :laudoMedico => @entrevista_medica.laudoMedico, :medicacao => @entrevista_medica.medicacao, :observacoes => @entrevista_medica.observacoes, :peso => @entrevista_medica.peso, :pressao => @entrevista_medica.pressao, :problema => @entrevista_medica.problema }
    end

    assert_redirected_to entrevista_medica_path(assigns(:entrevista_medica))
  end

  test "should show entrevista_medica" do
    get :show, :id => @entrevista_medica
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @entrevista_medica
    assert_response :success
  end

  test "should update entrevista_medica" do
    put :update, :id => @entrevista_medica, :entrevista_medica => { :altura => @entrevista_medica.altura, :laudoMedico => @entrevista_medica.laudoMedico, :medicacao => @entrevista_medica.medicacao, :observacoes => @entrevista_medica.observacoes, :peso => @entrevista_medica.peso, :pressao => @entrevista_medica.pressao, :problema => @entrevista_medica.problema }
    assert_redirected_to entrevista_medica_path(assigns(:entrevista_medica))
  end

  test "should destroy entrevista_medica" do
    assert_difference('EntrevistaMedica.count', -1) do
      delete :destroy, :id => @entrevista_medica
    end

    assert_redirected_to entrevista_medicas_path
  end
end
