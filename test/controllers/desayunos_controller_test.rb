require "test_helper"

class DesayunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desayuno = desayunos(:one)
  end

  test "should get index" do
    get desayunos_url
    assert_response :success
  end

  test "should get new" do
    get new_desayuno_url
    assert_response :success
  end

  test "should create desayuno" do
    assert_difference("Desayuno.count") do
      post desayunos_url, params: { desayuno: { descripcion: @desayuno.descripcion, nombre: @desayuno.nombre, pedido_id: @desayuno.pedido_id, precio: @desayuno.precio, tamaño: @desayuno.tamaño } }
    end

    assert_redirected_to desayuno_url(Desayuno.last)
  end

  test "should show desayuno" do
    get desayuno_url(@desayuno)
    assert_response :success
  end

  test "should get edit" do
    get edit_desayuno_url(@desayuno)
    assert_response :success
  end

  test "should update desayuno" do
    patch desayuno_url(@desayuno), params: { desayuno: { descripcion: @desayuno.descripcion, nombre: @desayuno.nombre, pedido_id: @desayuno.pedido_id, precio: @desayuno.precio, tamaño: @desayuno.tamaño } }
    assert_redirected_to desayuno_url(@desayuno)
  end

  test "should destroy desayuno" do
    assert_difference("Desayuno.count", -1) do
      delete desayuno_url(@desayuno)
    end

    assert_redirected_to desayunos_url
  end
end
