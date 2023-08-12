require "test_helper"

class OtrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @otro = otros(:one)
  end

  test "should get index" do
    get otros_url
    assert_response :success
  end

  test "should get new" do
    get new_otro_url
    assert_response :success
  end

  test "should create otro" do
    assert_difference("Otro.count") do
      post otros_url, params: { otro: { descripcion: @otro.descripcion, nombre: @otro.nombre, pedido_id: @otro.pedido_id, precio: @otro.precio, tamaño: @otro.tamaño } }
    end

    assert_redirected_to otro_url(Otro.last)
  end

  test "should show otro" do
    get otro_url(@otro)
    assert_response :success
  end

  test "should get edit" do
    get edit_otro_url(@otro)
    assert_response :success
  end

  test "should update otro" do
    patch otro_url(@otro), params: { otro: { descripcion: @otro.descripcion, nombre: @otro.nombre, pedido_id: @otro.pedido_id, precio: @otro.precio, tamaño: @otro.tamaño } }
    assert_redirected_to otro_url(@otro)
  end

  test "should destroy otro" do
    assert_difference("Otro.count", -1) do
      delete otro_url(@otro)
    end

    assert_redirected_to otros_url
  end
end
