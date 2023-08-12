require "application_system_test_case"

class TartaTest < ApplicationSystemTestCase
  setup do
    @tartum = tarta(:one)
  end

  test "visiting the index" do
    visit tarta_url
    assert_selector "h1", text: "Tarta"
  end

  test "should create tartum" do
    visit tarta_url
    click_on "New tartum"

    fill_in "Descripcion", with: @tartum.descripcion
    fill_in "Nombre", with: @tartum.nombre
    fill_in "Pedido", with: @tartum.pedido_id
    fill_in "Precio", with: @tartum.precio
    fill_in "Tamaño", with: @tartum.tamaño
    click_on "Create Tartum"

    assert_text "Tartum was successfully created"
    click_on "Back"
  end

  test "should update Tartum" do
    visit tartum_url(@tartum)
    click_on "Edit this tartum", match: :first

    fill_in "Descripcion", with: @tartum.descripcion
    fill_in "Nombre", with: @tartum.nombre
    fill_in "Pedido", with: @tartum.pedido_id
    fill_in "Precio", with: @tartum.precio
    fill_in "Tamaño", with: @tartum.tamaño
    click_on "Update Tartum"

    assert_text "Tartum was successfully updated"
    click_on "Back"
  end

  test "should destroy Tartum" do
    visit tartum_url(@tartum)
    click_on "Destroy this tartum", match: :first

    assert_text "Tartum was successfully destroyed"
  end
end
