require 'test_helper'

class TwitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twite = twites(:one)
  end

  test "should get index" do
    get twites_url
    assert_response :success
  end

  test "should get new" do
    get new_twite_url
    assert_response :success
  end

  test "should create twite" do
    assert_difference('Twite.count') do
      post twites_url, params: { twite: { body: @twite.body, user_id: @twite.user_id } }
    end

    assert_redirected_to twite_url(Twite.last)
  end

  test "should show twite" do
    get twite_url(@twite)
    assert_response :success
  end

  test "should get edit" do
    get edit_twite_url(@twite)
    assert_response :success
  end

  test "should update twite" do
    patch twite_url(@twite), params: { twite: { body: @twite.body, user_id: @twite.user_id } }
    assert_redirected_to twite_url(@twite)
  end

  test "should destroy twite" do
    assert_difference('Twite.count', -1) do
      delete twite_url(@twite)
    end

    assert_redirected_to twites_url
  end
end
