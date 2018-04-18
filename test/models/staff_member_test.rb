require 'test_helper'

class StaffMemberTest < ActiveSupport::TestCase

   test "create true staff" do
    staff = StaffMember.new(:email => "paula@gmail.com" , :password => "1234567")
    assert staff.save
   end

   test "create staff without password" do
    staff = StaffMember.new(:email => "paula@gmail.com" , :password => "")
    assert_not staff.save , "Cant save staff without password"
   end

   test "create staff without email" do
    staff = StaffMember.new(:email => "" , :password => "1234567")
    assert_not staff.save , "Cant save staff without email"
   end

  test "create staff with invalid email" do
    staff = StaffMember.new(:email => "qwertyu" , :password => "1234567")
    assert_not staff.save , "Cant save staff with invalid email"
   end

   test "create staff with invalid password" do
    staff = StaffMember.new(:email => "qwertyu" , :password => "12345")
    assert_not staff.save , "Cant save staff with pasword less than 6 characters"
   end

end
