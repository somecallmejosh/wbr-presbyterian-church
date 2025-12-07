require "application_system_test_case"

class ChurchMembersTest < ApplicationSystemTestCase
  setup do
    @church_member = church_members(:one)
  end

  test "visiting the index" do
    visit church_members_url
    assert_selector "h1", text: "Church members"
  end

  test "should create church member" do
    visit church_members_url
    click_on "New church member"

    fill_in "Date of birth", with: @church_member.date_of_birth
    fill_in "Name", with: @church_member.name
    click_on "Create Church member"

    assert_text "Church member was successfully created"
    click_on "Back"
  end

  test "should update Church member" do
    visit church_member_url(@church_member)
    click_on "Edit this church member", match: :first

    fill_in "Date of birth", with: @church_member.date_of_birth
    fill_in "Name", with: @church_member.name
    click_on "Update Church member"

    assert_text "Church member was successfully updated"
    click_on "Back"
  end

  test "should destroy Church member" do
    visit church_member_url(@church_member)
    accept_confirm { click_on "Delete this church member", match: :first }

    assert_text "Church member was successfully destroyed"
  end
end
