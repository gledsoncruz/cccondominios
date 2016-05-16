require 'test_helper'

class BlocosControllerTest < ActionController::TestCase
  setup do
    @bloco = blocos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blocos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bloco" do
    assert_difference('Bloco.count') do
      post :create, bloco: { descricao: @bloco.descricao, obs: @bloco.obs, sigla: @bloco.sigla }
    end

    assert_redirected_to bloco_path(assigns(:bloco))
  end

  test "should show bloco" do
    get :show, id: @bloco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bloco
    assert_response :success
  end

  test "should update bloco" do
    patch :update, id: @bloco, bloco: { descricao: @bloco.descricao, obs: @bloco.obs, sigla: @bloco.sigla }
    assert_redirected_to bloco_path(assigns(:bloco))
  end

  test "should destroy bloco" do
    assert_difference('Bloco.count', -1) do
      delete :destroy, id: @bloco
    end

    assert_redirected_to blocos_path
  end
end
