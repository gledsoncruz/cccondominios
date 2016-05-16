require 'test_helper'

class CondominiosControllerTest < ActionController::TestCase
  setup do
    @condominio = condominios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:condominios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create condominio" do
    assert_difference('Condominio.count') do
      post :create, condominio: { cep: @condominio.cep, cidade: @condominio.cidade, cnpj: @condominio.cnpj, endereco: @condominio.endereco, nome: @condominio.nome, uf: @condominio.uf }
    end

    assert_redirected_to condominio_path(assigns(:condominio))
  end

  test "should show condominio" do
    get :show, id: @condominio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @condominio
    assert_response :success
  end

  test "should update condominio" do
    patch :update, id: @condominio, condominio: { cep: @condominio.cep, cidade: @condominio.cidade, cnpj: @condominio.cnpj, endereco: @condominio.endereco, nome: @condominio.nome, uf: @condominio.uf }
    assert_redirected_to condominio_path(assigns(:condominio))
  end

  test "should destroy condominio" do
    assert_difference('Condominio.count', -1) do
      delete :destroy, id: @condominio
    end

    assert_redirected_to condominios_path
  end
end
