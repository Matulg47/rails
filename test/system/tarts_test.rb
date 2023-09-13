require "application_system_test_case"

class TartsTest < ApplicationSystemTestCase
  setup do
    @tart = tarts(:one)
  end

  test "visiting the index" do
    visit tarts_url
    assert_selector "h1", text: "Tarts"
  end

  test "should create tart" do
    visit tarts_url
    click_on "New tart"

    fill_in "", with: @tart.
    fill_in "Cantidad", with: @tart.cantidad
    fill_in "Descripcion", with: @tart.descripcion
    fill_in "Integer", with: @tart.integer
    fill_in "Nombre", with: @tart.nombre
    fill_in "Pedido", with: @tart.pedido_id
    fill_in "Precio", with: @tart.precio
    fill_in "Tamaño", with: @tart.tamaño
    click_on "Create Tart"

    assert_text "Tart was successfully created"
    click_on "Back"
  end

  test "should update Tart" do
    visit tart_url(@tart)
    click_on "Edit this tart", match: :first

    fill_in "", with: @tart.
    fill_in "Cantidad", with: @tart.cantidad
    fill_in "Descripcion", with: @tart.descripcion
    fill_in "Integer", with: @tart.integer
    fill_in "Nombre", with: @tart.nombre
    fill_in "Pedido", with: @tart.pedido_id
    fill_in "Precio", with: @tart.precio
    fill_in "Tamaño", with: @tart.tamaño
    click_on "Update Tart"

    assert_text "Tart was successfully updated"
    click_on "Back"
  end

  test "should destroy Tart" do
    visit tart_url(@tart)
    click_on "Destroy this tart", match: :first

    assert_text "Tart was successfully destroyed"
  end
end
