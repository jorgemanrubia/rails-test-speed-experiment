# README

This is a simple experiment to compare the speed of running Rails integration and system tests.

It uses a Rails 5.2 app that will respond to `/test/<label>` rendering `<label>` in a paragraph. It will run 100 simple integration and system tests to compare the results.

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

For system tests, I wanted to compare the difference of adding a good amount of CSS/JS to the mix. The browser has to parse that CSS and JS, and that should affect the speed for system tests. There is a flag `INCLUDE_JS_AND_CSS` that will add [Semantic UI JS and CSS](https://github.com/doabit/semantic-ui-sass) to the page . 

## Results

| Test | Time (s) |
| ---- | ------ |
| Integration | 0.55s|
| System (without JS/CSS) | 6.8s |
| System (with moderate JS/css) | 10.12s|

## How to run the tests

```bash
rake test # Run the integation tests
rake test:system # Run the system tests (without JS/CSS)
rake test:system INCLUDE_JS_AND_CSS=true # Run the system tests (with moderate JS/CSS)
```
