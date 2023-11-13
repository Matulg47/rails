require "application_system_test_case"

class PreciosTest < ApplicationSystemTestCase
  setup do
    @precio = precios(:one)
  end

  test "visiting the index" do
    visit precios_url
    assert_selector "h1", text: "Precios"
  end

  test "should create precio" do
    visit precios_url
    click_on "New precio"

    click_on "Create Precio"

    assert_text "Precio was successfully created"
    click_on "Back"
  end

  test "should update Precio" do
    visit precio_url(@precio)
    click_on "Edit this precio", match: :first

    click_on "Update Precio"

    assert_text "Precio was successfully updated"
    click_on "Back"
  end

  test "should destroy Precio" do
    visit precio_url(@precio)
    click_on "Destroy this precio", match: :first

    assert_text "Precio was successfully destroyed"
  end
end
