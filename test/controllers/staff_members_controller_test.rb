require 'test_helper'

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @staff = staff_members(:one)
  end


  test "should login" do
    post staff_member_session_url , params: {StaffMember: {email: @staff.email, encrypted_password: @staff.password}}
    assert :success
  end

  test "shouldn't login false data" do
    post staff_member_session_url , params: {StaffMember: {email: "false@test.com", encrypted_password: @staff.password}}
    assert_not false
  end

  test "should get index" do
    sign_in @staff
    get libraries_url
    assert_response :success
  end

  test "should get new" do
    sign_in @staff
    get new_library_url
    assert_response :success
  end

  test "should create library" do
    sign_in @staff
    library = libraries(:two)
    assert_difference('Library.count') do
      post libraries_url, params: { library: { location: "SDASDASD", name: "SDASDASDA", phone: 'DSFSDFS' } }
    end

    assert_redirected_to library_url(Library.last)
  end

  test "should show library" do
    sign_in @staff
    library = libraries(:one)
    get library_url(library)
    assert_response :success
  end

  test "should get edit" do
    sign_in @staff
    library = libraries(:one)
    get edit_library_url(library)
    assert_response :success
  end

  test "should update library" do
    sign_in @staff
    library = libraries(:two)
    patch library_url(library), params: { library: { location: library.location, name: library.name, phone: library.phone } }
    assert_redirected_to library_url(library)
  end

  test "should destroy library" do
    sign_in @staff
    library = libraries(:one)
    assert_difference('Library.count',-1) do
      delete library_url(library)
    end

    assert_redirected_to libraries_url
  end

end
