require "application_system_test_case"

class DesayunosTest < ApplicationSystemTestCase
  setup do
    @desayuno = desayunos(:one)
  end

  test "visiting the index" do
    visit desayunos_url
    assert_selector "h1", text: "Desayunos"
  end

  test "should create desayuno" do
    visit desayunos_url
    click_on "New desayuno"

    fill_in "Descripcion", with: @desayuno.descripcion
    fill_in "Nombre", with: @desayuno.nombre
    fill_in "Pedido", with: @desayuno.pedido_id
    fill_in "Precio", with: @desayuno.precio
    fill_in "Tamaño", with: @desayuno.tamaño
    click_on "Create Desayuno"

    assert_text "Desayuno was successfully created"
    click_on "Back"
  end

  test "should update Desayuno" do
    visit desayuno_url(@desayuno)
    click_on "Edit this desayuno", match: :first

    fill_in "Descripcion", with: @desayuno.descripcion
    fill_in "Nombre", with: @desayuno.nombre
    fill_in "Pedido", with: @desayuno.pedido_id
    fill_in "Precio", with: @desayuno.precio
    fill_in "Tamaño", with: @desayuno.tamaño
    click_on "Update Desayuno"

    assert_text "Desayuno was successfully updated"
    click_on "Back"
  end

  test "should destroy Desayuno" do
    visit desayuno_url(@desayuno)
    click_on "Destroy this desayuno", match: :first

    assert_text "Desayuno was successfully destroyed"
  end
end
