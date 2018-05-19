require 'test_helper'

class IntegrationTestTest < ActionDispatch::IntegrationTest
  20.times do |index|
    test "Integration test #{index}" do
      get test_path(label: index)
      assert_select "p", /#{index}/
    end
  end
end
