require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "name not null" do
      admin = Admin.new
      assert_not admin.save, "Saved the admin without a name"
  end

  test "email not null" do
      admin = Admin.new
      assert_not admin.save, "Saved the admin without a email"
  end

  test "password not null" do
      admin = Admin.new
      assert_not admin.save, "Saved the admin without a password"
  end


  test "add admin" do
      library = Library.new(:name => 'A', :location => 'A', :phone => 'A')
      library.save
      admin = Admin.new(:library_id => library.id, :name => 'mark' , :email => 'mark@gmail.com',:password => '123456')
      assert admin.save, "Saved the admin true"
  end

end
