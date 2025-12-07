require "test_helper"

class ChurchMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @church_member = church_members(:one)
  end

  test "should get index" do
    get church_members_url
    assert_response :success
  end

  test "should get new" do
    get new_church_member_url
    assert_response :success
  end

  test "should create church_member" do
    assert_difference("ChurchMember.count") do
      post church_members_url, params: { church_member: { date_of_birth: @church_member.date_of_birth, name: @church_member.name } }
    end

    assert_redirected_to church_member_url(ChurchMember.last)
  end

  test "should show church_member" do
    get church_member_url(@church_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_church_member_url(@church_member)
    assert_response :success
  end

  test "should update church_member" do
    patch church_member_url(@church_member), params: { church_member: { date_of_birth: @church_member.date_of_birth, name: @church_member.name } }
    assert_redirected_to church_member_url(@church_member)
  end

  test "should destroy church_member" do
    assert_difference("ChurchMember.count", -1) do
      delete church_member_url(@church_member)
    end

    assert_redirected_to church_members_url
  end
end
