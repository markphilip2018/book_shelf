require 'test_helper'

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library = libraries(:one)
  end

  test "shouldn't get index" do
    get libraries_url
    assert_redirected_to  new_staff_member_session_url
  end

  test "shouldn't get new" do
    get new_library_url
    assert_redirected_to  new_staff_member_session_url
  end

  test "shouldn't create library" do
    assert_no_difference('Library.count') do
      post libraries_url, params: { library: { location: @library.location, name: @library.name, phone: @library.phone } }
    end

    assert_redirected_to new_staff_member_session_url
  end

  test "shouldn't show library" do
    get library_url(@library)
    assert_redirected_to new_staff_member_session_url
  end

  test "shouldn't get edit" do
    get edit_library_url(@library)
    assert_redirected_to new_staff_member_session_url
  end

  test "shouldn't update library" do
    patch library_url(@library), params: { library: { location: @library.location, name: @library.name, phone: @library.phone } }
    assert_redirected_to new_staff_member_session_url
  end

  test "shouldn't destroy library" do
    assert_no_difference('Library.count') do
      delete library_url(@library)
    end

    assert_redirected_to new_staff_member_session_url
  end

end
