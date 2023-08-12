require "test_helper"

class TartaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tartum = tarta(:one)
  end

  test "should get index" do
    get tarta_url
    assert_response :success
  end

  test "should get new" do
    get new_tartum_url
    assert_response :success
  end

  test "should create tartum" do
    assert_difference("Tartum.count") do
      post tarta_url, params: { tartum: { descripcion: @tartum.descripcion, nombre: @tartum.nombre, pedido_id: @tartum.pedido_id, precio: @tartum.precio, tamaño: @tartum.tamaño } }
    end

    assert_redirected_to tartum_url(Tartum.last)
  end

  test "should show tartum" do
    get tartum_url(@tartum)
    assert_response :success
  end

  test "should get edit" do
    get edit_tartum_url(@tartum)
    assert_response :success
  end

  test "should update tartum" do
    patch tartum_url(@tartum), params: { tartum: { descripcion: @tartum.descripcion, nombre: @tartum.nombre, pedido_id: @tartum.pedido_id, precio: @tartum.precio, tamaño: @tartum.tamaño } }
    assert_redirected_to tartum_url(@tartum)
  end

  test "should destroy tartum" do
    assert_difference("Tartum.count", -1) do
      delete tartum_url(@tartum)
    end

    assert_redirected_to tarta_url
  end
end
