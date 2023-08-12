require "application_system_test_case"

class MacaroonsTest < ApplicationSystemTestCase
  setup do
    @macaroon = macaroons(:one)
  end

  test "visiting the index" do
    visit macaroons_url
    assert_selector "h1", text: "Macaroons"
  end

  test "should create macaroon" do
    visit macaroons_url
    click_on "New macaroon"

    fill_in "Descripcion", with: @macaroon.descripcion
    fill_in "Nombre", with: @macaroon.nombre
    fill_in "Pedido", with: @macaroon.pedido_id
    fill_in "Precio", with: @macaroon.precio
    fill_in "Tamaño", with: @macaroon.tamaño
    click_on "Create Macaroon"

    assert_text "Macaroon was successfully created"
    click_on "Back"
  end

  test "should update Macaroon" do
    visit macaroon_url(@macaroon)
    click_on "Edit this macaroon", match: :first

    fill_in "Descripcion", with: @macaroon.descripcion
    fill_in "Nombre", with: @macaroon.nombre
    fill_in "Pedido", with: @macaroon.pedido_id
    fill_in "Precio", with: @macaroon.precio
    fill_in "Tamaño", with: @macaroon.tamaño
    click_on "Update Macaroon"

    assert_text "Macaroon was successfully updated"
    click_on "Back"
  end

  test "should destroy Macaroon" do
    visit macaroon_url(@macaroon)
    click_on "Destroy this macaroon", match: :first

    assert_text "Macaroon was successfully destroyed"
  end
end
