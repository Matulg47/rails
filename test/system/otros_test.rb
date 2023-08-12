require "application_system_test_case"

class OtrosTest < ApplicationSystemTestCase
  setup do
    @otro = otros(:one)
  end

  test "visiting the index" do
    visit otros_url
    assert_selector "h1", text: "Otros"
  end

  test "should create otro" do
    visit otros_url
    click_on "New otro"

    fill_in "Descripcion", with: @otro.descripcion
    fill_in "Nombre", with: @otro.nombre
    fill_in "Pedido", with: @otro.pedido_id
    fill_in "Precio", with: @otro.precio
    fill_in "Tamaño", with: @otro.tamaño
    click_on "Create Otro"

    assert_text "Otro was successfully created"
    click_on "Back"
  end

  test "should update Otro" do
    visit otro_url(@otro)
    click_on "Edit this otro", match: :first

    fill_in "Descripcion", with: @otro.descripcion
    fill_in "Nombre", with: @otro.nombre
    fill_in "Pedido", with: @otro.pedido_id
    fill_in "Precio", with: @otro.precio
    fill_in "Tamaño", with: @otro.tamaño
    click_on "Update Otro"

    assert_text "Otro was successfully updated"
    click_on "Back"
  end

  test "should destroy Otro" do
    visit otro_url(@otro)
    click_on "Destroy this otro", match: :first

    assert_text "Otro was successfully destroyed"
  end
end
