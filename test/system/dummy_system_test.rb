require "application_system_test_case"

class DummySystemTest < ApplicationSystemTestCase
  100.times do |index|
    test "Integration test #{index}" do
      visit test_path(label: index)
      assert_selector 'p', text: /#{index}/
    end
  end

end
