require 'test_helper'

class LibraryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "name not null" do
      library = Library.new
      assert_not library.save, "Saved the library without a name"
  end
end
