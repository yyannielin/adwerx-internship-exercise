require "application_system_test_case"

class PostalCodesTest < ApplicationSystemTestCase
  setup do
    @postal_code = postal_codes(:one)
  end

  test "visiting the index" do
    visit postal_codes_url
    assert_selector "h1", text: "Postal Codes"
  end

  test "creating a Postal code" do
    visit postal_codes_url
    click_on "New Postal Code"

    fill_in "City", with: @postal_code.city
    fill_in "Country", with: @postal_code.country
    fill_in "Latitude", with: @postal_code.latitude
    fill_in "Longitude", with: @postal_code.longitude
    fill_in "Postal code", with: @postal_code.postal_code
    fill_in "State", with: @postal_code.state
    click_on "Create Postal code"

    assert_text "Postal code was successfully created"
    click_on "Back"
  end

  test "updating a Postal code" do
    visit postal_codes_url
    click_on "Edit", match: :first

    fill_in "City", with: @postal_code.city
    fill_in "Country", with: @postal_code.country
    fill_in "Latitude", with: @postal_code.latitude
    fill_in "Longitude", with: @postal_code.longitude
    fill_in "Postal code", with: @postal_code.postal_code
    fill_in "State", with: @postal_code.state
    click_on "Update Postal code"

    assert_text "Postal code was successfully updated"
    click_on "Back"
  end

  test "destroying a Postal code" do
    visit postal_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Postal code was successfully destroyed"
  end
end
