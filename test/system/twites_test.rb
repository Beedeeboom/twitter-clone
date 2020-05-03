require "application_system_test_case"

class TwitesTest < ApplicationSystemTestCase
  setup do
    @twite = twites(:one)
  end

  test "visiting the index" do
    visit twites_url
    assert_selector "h1", text: "Twites"
  end

  test "creating a Twite" do
    visit twites_url
    click_on "New Twite"

    fill_in "Body", with: @twite.body
    fill_in "User", with: @twite.user_id
    click_on "Create Twite"

    assert_text "Twite was successfully created"
    click_on "Back"
  end

  test "updating a Twite" do
    visit twites_url
    click_on "Edit", match: :first

    fill_in "Body", with: @twite.body
    fill_in "User", with: @twite.user_id
    click_on "Update Twite"

    assert_text "Twite was successfully updated"
    click_on "Back"
  end

  test "destroying a Twite" do
    visit twites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Twite was successfully destroyed"
  end
end
