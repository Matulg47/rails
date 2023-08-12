require "test_helper"

class MacaroonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @macaroon = macaroons(:one)
  end

  test "should get index" do
    get macaroons_url
    assert_response :success
  end

  test "should get new" do
    get new_macaroon_url
    assert_response :success
  end

  test "should create macaroon" do
    assert_difference("Macaroon.count") do
      post macaroons_url, params: { macaroon: { descripcion: @macaroon.descripcion, nombre: @macaroon.nombre, pedido_id: @macaroon.pedido_id, precio: @macaroon.precio, tamaño: @macaroon.tamaño } }
    end

    assert_redirected_to macaroon_url(Macaroon.last)
  end

  test "should show macaroon" do
    get macaroon_url(@macaroon)
    assert_response :success
  end

  test "should get edit" do
    get edit_macaroon_url(@macaroon)
    assert_response :success
  end

  test "should update macaroon" do
    patch macaroon_url(@macaroon), params: { macaroon: { descripcion: @macaroon.descripcion, nombre: @macaroon.nombre, pedido_id: @macaroon.pedido_id, precio: @macaroon.precio, tamaño: @macaroon.tamaño } }
    assert_redirected_to macaroon_url(@macaroon)
  end

  test "should destroy macaroon" do
    assert_difference("Macaroon.count", -1) do
      delete macaroon_url(@macaroon)
    end

    assert_redirected_to macaroons_url
  end
end
