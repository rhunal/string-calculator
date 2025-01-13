# String Calculator

This is a Ruby implementation of the **String Calculator**. The project demonstrates test-driven development (TDD) practices, solving incremental challenges with a focus on clean, maintainable, and well-tested code.

---

## Features

- Add numbers from a string input with delimiters.
- Supports:
  - Comma (`,`) and newline (`\n`) as default delimiters.
  - Custom single and multi-character delimiters.
  - Multiple custom delimiters.
- Ignores numbers greater than 1000.
- Raises exceptions for negative numbers and lists all negatives in the error message.

---

## Requirements

- Ruby 2.6.6 or later
- Bundler (for managing dependencies)

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/rhunal/string-calculator.git
   cd string-calculator
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

---

## Usage

You can use the `StringCalculator` class in an interactive Ruby session (`irb`) or a script.

### Example:
```ruby
require './string_calculator'

calculator = StringCalculator.new

puts calculator.add("1,2,3")           # => 6
puts calculator.add("//[***]\n1***2")  # => 3

begin
  calculator.add("1,-2,-3")
rescue => e
  puts e.message                       # => "negative numbers not allowed: -2, -3"
end
```

---

## Running Tests

This project uses **RSpec** for testing.

### Run Tests
```bash
bundle exec rspec
```

### Example RSpec Log
Here’s an example output after running the tests:

```plaintext
StringCalculator
  #add
    when the input is an empty string
      returns 0
    when the input is a single number string
      returns the number itself
    when the input is a two comma-separated numbers string
      returns the sum of the numbers
    when the input contains multiple comma-separated numbers
      returns the sum of the numbers
    when the input contains new lines between numbers
      returns the sum of the numbers
    when the input contains custom delimiters
      returns the sum of the numbers
    when the input contains negative numbers
      raises an exception with 'negative numbers not allowed <negative_number>'
    when the input contains numbers greater than 1000
      ignores numbers greater than 1000 and returns the sum of valid numbers
    when the input contains custom delimiters of any length
      returns the sum of the numbers
    when the input contains multiple delimiters
      returns the sum of the numbers
    when the input contains multiple delimiters of any length
      returns the sum of the numbers

Finished in 0.00311 seconds (files took 0.05583 seconds to load)
11 examples, 0 failures
```
