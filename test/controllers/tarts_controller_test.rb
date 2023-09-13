require "test_helper"

class TartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tart = tarts(:one)
  end

  test "should get index" do
    get tarts_url
    assert_response :success
  end

  test "should get new" do
    get new_tart_url
    assert_response :success
  end

  test "should create tart" do
    assert_difference("Tart.count") do
      post tarts_url, params: { tart: { : @tart., cantidad: @tart.cantidad, descripcion: @tart.descripcion, integer: @tart.integer, nombre: @tart.nombre, pedido_id: @tart.pedido_id, precio: @tart.precio, tamaño: @tart.tamaño } }
    end

    assert_redirected_to tart_url(Tart.last)
  end

  test "should show tart" do
    get tart_url(@tart)
    assert_response :success
  end

  test "should get edit" do
    get edit_tart_url(@tart)
    assert_response :success
  end

  test "should update tart" do
    patch tart_url(@tart), params: { tart: { : @tart., cantidad: @tart.cantidad, descripcion: @tart.descripcion, integer: @tart.integer, nombre: @tart.nombre, pedido_id: @tart.pedido_id, precio: @tart.precio, tamaño: @tart.tamaño } }
    assert_redirected_to tart_url(@tart)
  end

  test "should destroy tart" do
    assert_difference("Tart.count", -1) do
      delete tart_url(@tart)
    end

    assert_redirected_to tarts_url
  end
end
