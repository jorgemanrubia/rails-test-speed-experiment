# README

This is a simple experiment to compare the speed of running Rails integration and system tests.

It uses a Rails 5.2 app that will respond to `/test/<label>` rendering `<label>` in a paragraph. With that in place, it runs the following tests:

## Integration test

```ruby
require 'test_helper'

class DummyIntegrationTest < ActionDispatch::IntegrationTest
  100.times do |index|
    test "Integration test #{index}" do
      get test_path(label: index)
      assert_select "p", /#{index}/
    end
  end
end
```

## System test

```ruby
require "application_system_test_case"

class DummySystemTest < ApplicationSystemTestCase
  100.times do |index|
    test "Integration test #{index}" do
      visit test_path(label: index)
      assert_selector 'p', text: /#{index}/
    end
  end

end
```

## Results

| Test | Result |
| Integration | 0.49s|
| System (without JS/CSS) | 5.9 |
| System (with moderate JS/css) | 8.666s|